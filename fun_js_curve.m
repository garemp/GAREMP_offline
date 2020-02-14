function [ x, y ] = fun_js_curve( s, t )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% Formula for generating Bezier curve
% cp is a control point

cp = [(s.x + t.x) / 2 + (t.y - s.y) / 4, (s.y + t.y) / 2 + (s.x - t.x) / 4];
tp = [0:0.01:1];

x = (1 - tp) .^ 2 * s.x + 2 * tp .* (1 - tp) * cp(1) + tp .* tp * t.x;
y = (1 - tp) .^ 2 * s.y + 2 * tp .* (1 - tp) * cp(2) + tp .* tp * t.y;

end
