function [ areamatrix_orig ] = calc_area_matrix( xx, yy, DT, center_nocarto, radium_nocarto, dt_count )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% Calculate a matrix to represent the topology of a triangulated network
% Each row of the matrix contains values of a given metric (e.g., area of triangle) for a given vertex
% For the given vertex, all adjacent faces to that vertex are obtained, and the metric for all adjacent faces are calcultaed 
% The metric is stored in one row of the matrix, and largest one is at first column
% Other values of the metric is counterclockwise ordered
% For the given vertex, a vertex of the largest neighbor face is select
% Same process is applied to the neighbor vertex (calculate adjacent faces and metrics)
%
% For a given node N, it is the common vertex for six faces, just like this
%     V8 ---  V7
%    / \ 107 /  \
%   /   \   /    \
%  / 102 \ /  103 \
% V9 ---  V1  ---  V2
%  \ 97  /  \  96 /  \
%   \   /    \   /    \
%    \ /  95  \ /  88  \
%     V6  ---  N  ---  V3
%      \  84  / \  80  /
%       \    /   \    /
%        \  /  77 \  /
%         V5  ---- V4
% Metric (using specific metric or the area of faces) for six faces are calculated
% calc_area_matrix return a matrix, the Nth row of the matrix is like this 
%     96    88    80    77    84    95     0     0     0     0    96   103   100    89    85    88     0     0     0     0
% The largest value of that metric is in the first column, other faces follow clockwise with zero filling
% The triangle N-V1-V2 has the largest value of metric, metric of triangle N-V2-V3 is in the second column of matrix
% Then using vertex V1 as the central vertex, re-calculated metrics for faces with common vertex V1
% Counterclockwise is used, and zeros fill at tail
% Above-computed matrix is used to match two triangulated networks

areamatrix_orig = [];
for i = 1:size(xx, 2)
    [ ret, inter, j ] = calc_area_matrix_inside( i, xx, yy, DT, center_nocarto, radium_nocarto, dt_count );
    if inter
        [ ret2, inter, jjj ] = calc_area_matrix_inside( j, xx, yy, DT, center_nocarto, radium_nocarto, dt_count );
        for j = 1:size(ret2, 2)
            jj = mod(j, size(ret2, 2)) + 1;
            if ret(1) == ret2(jj) && ret(2) == ret2(j)
                if jj > j
                    ret2 = [ret2(jj:end),ret2(1:j)];
                else
                    ret2 = ret2(jj:j);
                end
                break;
            end
        end
        areamatrix_orig(end + 1, :) = [ret, zeros(1, 10 - size(ret, 2)), ret2, zeros(1, 10 - size(ret2, 2))];
    else
        [ ret2, inter, j ] = calc_area_matrix_inside( j, xx, yy, DT, center_nocarto, radium_nocarto, dt_count );
        areamatrix_orig(end + 1, :) = [ret, zeros(1, 10 - size(ret, 2)), ret2, zeros(1, 10 - size(ret2, 2))];
    end
end

end

function [ ser, inter, j ] = calc_area_matrix_inside( i, xx, yy, DT, center_nocarto, radium_nocarto, dt_count )
    equal = (DT == i);
    ff1 = find(equal(:, 1));
    ff2 = find(equal(:, 2));
    ff3 = find(equal(:, 3));
    idx = [ff1; ff2; ff3];
    sq1 = DT(ff1, [2:3]);
    sq2 = DT(ff2, [1,3]);
    sq3 = DT(ff3, [1:2]);
    sq = [sq1;sq2;sq3];
    u = unique(sq);
    inter = true;
    for ui = 1:size(u, 1)
        if size(find(sq == u(ui)), 1) == 1
            inter = false;
            bg = find(sq == u(ui));
            break;
        end
    end
    if inter
        cur = obtain_order(sq, 1, 2);
    else
        cur = obtain_order(sq, 1 + mod(bg - 1, size(sq, 1)), 2 - floor((bg - 1) / size(sq, 1)));
    end
    
    [ ptc, pto, pt1 ] = find_oppsite(i, xx, yy, DT, idx, cur);
    
    % re-order
    if sign(sum(cross([pto-ptc, 0], [pt1-ptc, 0]))) < 0
        cur = cur(end:-1:1);
        [ ptc, pto, pt1 ] = find_oppsite(i, xx, yy, DT, idx, cur);
    end
    
    xt = (xx(i) - center_nocarto(1)) / radium_nocarto * 100;
    yt = (yy(i) - center_nocarto(2)) / radium_nocarto * 100;
    ser = round(dt_count(idx(cur)))';
    if inter
        m = max(ser) - ser;
        ff = find(m == 0);
        if size(ff, 1) == 1
            ser = [ser(ff:end),ser(1:ff-1)];
        else
            ser = 0;
            pause;
        end
        cur = [cur(ff:end),cur(1:ff-1)];
        [ ptc, pto, pt1 ] = find_oppsite(i, xx, yy, DT, idx, cur);
    end
    
    if ser(1) == ser(end)
        ff = find(ser == ser(1));
        if size(ff, 2) > 1
            ser = [ser(size(ser, 2)-size(ff, 2)+2:end), ser(1:size(ser, 2)-size(ff, 2)+1)];
        end
    end
    
    for j = 1:size(xx, 2)
        if pto(1) == xx(j) && pto(2) == yy(j)
            break;
        end
    end
    
end

function [ ptc, pto, pt1 ] = find_oppsite(i, xx, yy, DT, idx, cur)

    ptc = [xx(i); yy(i)]';
    tri1 = [xx(DT(idx(cur(1)),:)); yy(DT(idx(cur(1)),:))];
    tri2 = [xx(DT(idx(cur(2)),:)); yy(DT(idx(cur(2)),:))];
    un = unique([tri1, tri2]','rows');
    for uni = 1:size(un, 1)
        unit = un(uni, :);
        ffc = find(ismember(ptc, unit, 'rows'));
        ff1 = find(ismember(tri1', unit, 'rows'));
        ff2 = find(ismember(tri2', unit, 'rows'));
        if ~isempty(ff1) && isempty(ff2)
            pt1 = unit;
        end
        if ~isempty(ff1) && ~isempty(ff2) && isempty(ffc)
            pto = unit;
        end
    end

end

function [ cur ] = obtain_order(sq, bg, col)

count = size(sq, 1);
count = count - 1;
cur = bg;
while (count > 0)
    next = sq(cur(end), col);
    ff1 = find(sq(:, 1) == next);
    ff2 = find(sq(:, 2) == next);
    ff = [ff1; ff2];
    cur(end + 1) = ff(find(ff ~= cur(end)));
    count = count - 1;
    col = find(sq(cur(end), :) ~= sq(cur(end - 1), col));
end

end

