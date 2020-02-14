function [ overlay_mat ] = fun_calc_overlay( nodes, edges, offs_by_radius )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% Given a pair of curves, check whether they are intersected or not
% Intersection is defined as 
% 1.two curves are closely enough (less than given threshold)
% 2.two curves intersect at non-endpoint
% 3.two curves intersect at endpoint of both curves, and angle between tangents is less than a given threshold, or greater than pi minus that threshold

overlay_mat = zeros(size(edges, 2), size(edges, 2));

tic
    for i = 1:size(edges, 2)
        for j = i+1:size(edges, 2)
            e1 = edges{i};
            e2 = edges{j};
            id = [];
            id(1) = str2num(e1.source);
            id(2) = str2num(e1.target);
            id(3) = str2num(e2.source);
            id(4) = str2num(e2.target);
            x = [];
            y = [];
            label = cell(1, 4);
            for l = 1:4
                for k = 1:size(nodes, 2)
                    n = nodes{k};
                    if str2num(n.id) == id(l)
                        x(l) = n.x;
                        y(l) = n.y;
                        label{l} = n.label;
                        break;
                    end
                end
            end
            s = [];
            t = [];
            s.x = x(1);
            s.y = y(1);
            t.x = x(2);
            t.y = y(2);
            [xa, ya] = fun_js_curve(s, t);
            s.x = x(3);
            s.y = y(3);
            t.x = x(4);
            t.y = y(4);
            [xb, yb] = fun_js_curve(s, t);
            [idx, d] = knnsearch([xa; ya]', [xb; yb]');
            if min(d) < offs_by_radius
                overlay_mat(i, j) = 1;
            end
%             INTERSECTION CHECK FOR NON OFFSETED CURVES
%             THEN CHECKING ANGULAR CONDITIONS
            [xi, yi] = polyxpoly(xa, ya, xb, yb);
            if size(xi, 1) == 1 % intersect at ONE POINT
                endpt = false;
                endptpos = [];
                for m = 1:size(xi, 1)
                    for l = 1:4
                        if sqrt((xi(m) - x(l)) ^ 2 + (yi(m) - y(l)) ^ 2) < 1e-3
                            endpt = true;
                            endptpos(end + 1) = l;
                        end
                    end
                end
                if endpt
%                     CHECKING ANGLE
                    if endptpos(1) == 1
                        dir1 = [xa(2) - xa(1), ya(2) - ya(1)];
                    else
                        dir1 = [xa(end) - xa(end - 1), ya(end) - ya(end - 1)];
                    end
                    if endptpos(2) == 3
                        dir2 = [xb(2) - xb(1), yb(2) - yb(1)];
                    else
                        dir2 = [xb(end) - xb(end - 1), yb(end) - yb(end - 1)];
                    end
                    dist1 = sqrt(dot(dir1, dir1));
                    dist2 = sqrt(dot(dir2, dir2));
                    dir1 = dir1 / dist1;
                    dir2 = dir2 / dist2;
                    if abs(dot(dir1, dir2)) < cos(45 / 180 * pi)
                        overlay_mat(i, j) = 0;
                    end
                end
            end
        end
    end
toc
    
end

