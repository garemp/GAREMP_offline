function [  ] = distortGraph( filename, outfile )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% Distort a graph by using cartogram algorithm

addpath('jsonlab');
addpath('matlab-toolboxes/toolbox_graph');
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

[radium_nocarto, center_nocarto] = ExactMinBoundCircle([xx; yy]');

DT = delaunay(xx, yy);

edges_matrix_orig = calc_edge_matrix( xx, yy, DT );

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

dtvert_count = zeros(size(xx, 2), 1);

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
        if ~isfield(e, 'flip')
            e.flip = 'false';
        end
        [x, y] = fun_js_curve(s, t, e.flip);
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

% system(['./cartogram -eig maps_carto.json -a dt_count.csv']);

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

for i = 1:size(dt_pts, 1)
    area = areamatrix(i, :);
    [ff, d] = knnsearch(areamatrix_orig, area, 'K', 3);
    if ~isempty(ff)
        pt_match(i) = ff(1);
    end
    if d(3) < 20
        pt_match(i) = 0;
    end
end

for i = 1:size(dt_pts, 1)
    ff = find(pt_match == i);
    if size(ff, 1) > 1
        pt_match(ff) = 0;
    end
end

for i = 1:size(dt_pts, 1)
    if pt_match(i) == 0
        pt_match(i) = 1000 + i;
    end
end

while 1
    fd = find(pt_match > 1000);
    if size(fd, 1) > 0

        for i = 1:size(idx, 1)
            for j = 1:3
                idx_adj(i, j) = pt_match(idx(i, j));
            end
        end

        edges_matrix = calc_edge_matrix( xx, yy, idx_adj );

        for i = 1:size(dt_pts, 1)
            ne_orig = edges_matrix_orig(i, :);
            ne = edges_matrix(i, :);
            ff = find(ne > 999);
            if size(ff, 2) == 1
                for j = 1:ff - 1
                    ffo = find(ne_orig == ne(j));
                    ne_orig(ffo) = 0;
                end
                ffo = find(ne_orig ~= 0);
                if size(ffo, 2) == 1
                    pt_match(ne(ff) - 1000) = ne_orig(ffo);
                end
            end
        end
    else
        break;
    end
end

nodes_carto = nodes;
for i = 1:size(nodes, 2)
    nodes_carto{pt_match(i)}.x = dt_pts(i, 1);
    nodes_carto{pt_match(i)}.y = dt_pts(i, 2);
end
nodes = nodes_carto;

data.nodes = nodes;

savejson([], data, outfile);

end
