function [ x, y ] = fun_js_curve( s, t )

cp = [(s.x + t.x) / 2 + (t.y - s.y) / 4, (s.y + t.y) / 2 + (s.x - t.x) / 4];
tp = [0:0.01:1];

x = (1 - tp) .^ 2 * s.x + 2 * tp .* (1 - tp) * cp(1) + tp .* tp * t.x;
y = (1 - tp) .^ 2 * s.y + 2 * tp .* (1 - tp) * cp(2) + tp .* tp * t.y;

end
