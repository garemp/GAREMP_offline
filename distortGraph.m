function [  ] = distortGraph( filename, outname )

addpath('jsonlab');
addpath('AntonSemechko-Bounding-Spheres-And-Circles');
addpath('AntonSemechko-Bounding-Spheres-And-Circles/Auxiliary');

data = loadjson(filename);

nodes = data.nodes;
edges = data.edges;

[radium_nocarto, center_nocarto] = ExactMinBoundCircle([xx; yy]');

DT = delaunay(xx, yy);

djson.type='FeatureCollection';
djson.features=cell(1, size(DT, 1));
djson.bbox = [min(xx), min(yy), max(xx), max(yy)];
for i = 1:size(DT, 1)
    idx = DT(i, :);
    xt = xx(idx([1:3,1]));
    yt = yy(idx([1:3,1]));
    djson.features{i}.type = 'Feature';
    djson.features{i}.id = i - 1;
    djson.features{i}.geometry.type = 'MultiPolygon';
    djson.features{i}.geometry.coordinates = [xt', yt'];
    djson.features{i}.properties.cartogram_id = num2str(i);
end

savejson([], djson, 'maps_carto.json');
add_brackets('maps_carto.json');

xt = (xx - center_nocarto(1)) / radium_nocarto * 100;
yt = (yy - center_nocarto(2)) / radium_nocarto * 100;
[idx, d] = knnsearch([xt; yt]', [xt; yt]', 'K', 2);
mindforall = min(d(:, 2));

disp('calclating metrics for nodes in graph ...')
tic
for i = 1:size(xx, 2)
    xt = xx(i);
    yt = yy(i);
    xt = (xt - center_nocarto(1)) / radium_nocarto * 100;
    yt = (yt - center_nocarto(2)) / radium_nocarto * 100;
    mind = 1000;
    for j = 1:size(edges, 2)
        e = edges{j};
        [ s, t ] = fun_edge_curve( nodes, e );
        [x, y] = fun_js_curve(s, t);
        x = (x - center_nocarto(1)) / radium_nocarto * 100;
        y = (y - center_nocarto(2)) / radium_nocarto * 100;
        [idx, d] = knnsearch([x; y]', [xt, yt]);
        if d < 1e-6 && (idx == 1 || idx == size(x, 2))
            dtvert_count(i) = dtvert_count(i) + 0.1;
            dist = sqrt((x(1) - x(end)) ^ 2 + (y(1) - y(end)) ^ 2);
            if dist < mind
                mind = dist;
            end
            continue;
        end
        dtvert_count(i) = dtvert_count(i) + 1 / (d + 1);            
    end
    dtvert_count(i) = dtvert_count(i) + 1 / (mind / mindforall + 1);
end
toc

dt_count = zeros(size(DT, 1), 1);
for i = 1:size(DT, 1)
    idx = DT(i, :);
    dt_count(i) = dt_count(i) + dtvert_count(idx(1)); 
    dt_count(i) = dt_count(i) + dtvert_count(idx(2)); 
    dt_count(i) = dt_count(i) + dtvert_count(idx(3)); 
end

areamatrix_orig = calc_area_matrix( xx, yy, DT, center_nocarto, radium_nocarto, dt_count * 10 );

comma = repmat(',', size(dt_count, 1), 1);
ret = repmat(sprintf('\n'), size(dt_count, 1), 1);
state = repmat('state ', size(dt_count, 1), 1);
str = [num2str([1:size(DT, 1)]'), comma, num2str(round(dt_count*10)), ret];

fp = fopen(['dt_count.csv'], 'w');
fwrite(fp, ['Region.Id,Region.Data', sprintf('\n')], 'char');
fwrite(fp, str', 'char');
fclose(fp);

system(['./cartogram -eig maps_carto.json -a dt_count.csv']);

fid = fopen('cartogram.eps');

dt_tris = [];

tline = fgetl(fid);
while ischar(tline)
    if size(tline, 2) > 2 && size(tline, 2) < 30
        if strcmp(tline(end-1:end), ' l')
            dt_tris(end + 1, :) = str2num(tline(1:end-2));
        end
    end
    tline = fgetl(fid);
end

fclose(fid);

thisarea = [];

for i=1:size(dt_tris, 1)/4
    xxx = dt_tris(i*4-3:i*4, 1);
    yyy = dt_tris(i*4-3:i*4, 2);
    plot(xxx, yyy, 'r-');
    thisarea(end + 1) = polyarea(xxx, yyy);
end

thisarea = round(thisarea / max(thisarea) * max(dt_count) * 10);

dt_pts = unique(dt_tris, 'rows');
areamatrix = [];

[radium_nocarto, center_nocarto] = ExactMinBoundCircle(dt_pts);

idx = [];

for i = 1:size(dt_tris, 1) / 4
    tri = dt_tris([i*4-3,i*4-2,i*4-1], :);
    ff = find(ismember(dt_pts, tri, 'rows'));
    idx(end + 1, :) = ff';
end

areamatrix = calc_area_matrix( dt_pts(:, 1)', dt_pts(:, 2)', idx, center_nocarto, radium_nocarto, thisarea' );

pt_match = zeros(size(dt_pts, 1), 1);
pt_not_matched = 1:size(dt_pts, 1);
pt_error = zeros(size(dt_pts, 1), 1);

for i = 1:size(dt_pts, 1)
    area = areamatrix(i, :);
    [ff, d] = knnsearch(areamatrix_orig, area, 'K', 3);
    if pt_not_matched(ff(1)) == 0
        disp('!!ERROR: ALREADY SET TO ZERO !!!!!!!!!!');
    else
        pt_not_matched(ff(1)) = 0;
    end
    if ~isempty(ff)
        pt_match(i) = ff(1);
    end
end

pt_match(65) = 10;
pt_match(37) = 57;
pt_match(32) = 13;
pt_match(26) = 73;
pt_match(38) = 58;
pt_match(82) = 75;
pt_match(78) = 11;
pt_match(62) = 85;
pt_match(86) = 71;
pt_match(83) = 35;

nodes_carto = nodes;
for i = 1:size(nodes, 2)
    nodes_carto{pt_match(i)}.x = dt_pts(i, 1);
    nodes_carto{pt_match(i)}.y = dt_pts(i, 2);
end
nodes = nodes_carto;

data.nodes = nodes;

savejson([], data, outfile);

end
