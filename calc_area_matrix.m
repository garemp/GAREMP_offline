function [ areamatrix_orig ] = calc_area_matrix( xx, yy, DT, center_nocarto, radium_nocarto, dt_count )

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

