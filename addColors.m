function [  ] = addColors( filename, outfile )

addpath('jsonlab');
addpath('AntonSemechko-Bounding-Spheres-And-Circles');
addpath('AntonSemechko-Bounding-Spheres-And-Circles/Auxiliary');

data = loadjson(filename);

nodes = data.nodes;
edges = data.edges;

xx = [];
yy = [];

for i = 1:size(nodes, 2)
    n = nodes{i};
    xx(end + 1) = n.x;
    yy(end + 1) = n.y;
end

[radium_carto, center_carto] = ExactMinBoundCircle([xx; yy]');

offs_by_percent = 100;

overlay_mat = fun_calc_overlay(nodes, edges, radium_carto / offs_by_percent);

conn_from = [];
conn_to = [];
for f = 1:size(overlay_mat, 2)
    for ff = f:size(overlay_mat, 2)
        if overlay_mat(f, ff)
            conn_from = [conn_from, f];
            conn_to = [conn_to, ff];
        end
    end
end

fp = fopen('maps.col', 'w');
fwrite(fp, ['p edge ', num2str(size(overlay_mat, 2)), ' ', num2str(size(conn_from, 2)), sprintf('\n')], 'char');
for i = 1:size(conn_from, 2)
    fwrite(fp, ['e ', num2str(conn_from(i)), ' ', num2str(conn_to(i)), sprintf('\n')], 'char');
end
fclose(fp);

system('./color maps.col -l > carto_color');

fid = fopen('carto_color');
fidout = fopen('maps_color', 'w');

lcount = 0;

tline = fgetl(fid);
while ischar(tline)
    if lcount > 1
        fwrite(fidout, [tline(2:end), sprintf('\n')], 'char');
    end
    tline = fgetl(fid);
    lcount = lcount + 1;
end

fclose(fid);
fclose(fidout);

color = load('maps_color');

            % red           green       yellow      blue        orange      
draw_color = {[230,25,75],[60,180,75],[255,225,25],[67,99,216],[245,130,49], ...
    [70,240,240], [240,50,230], [145,30,180]};
        % cyan      magenta         purple
        
count = zeros(1, 11);

for i = 1:size(edges, 2)
    e = edges{i};
    kk = find(color(:, 1) == i);
    c = draw_color{color(kk, 2) + 1};
    count(color(kk, 2) + 1) = count(color(kk, 2) + 1) + 1;
    data.edges{i}.color = ['rgb(', num2str(c(1)), ',', num2str(c(2)), ',', num2str(c(3)), ')'];
end

savejson([], data, outfile);

end

