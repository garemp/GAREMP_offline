function [  ] = flipEdges( filename, outname )

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

comma = repmat(',', size(dt_count, 1), 1);
ret = repmat(sprintf('\n'), size(dt_count, 1), 1);
state = repmat('state ', size(dt_count, 1), 1);
str = [num2str([1:size(DT, 1)]'), comma, num2str(round(dt_count*10)), ret];

fp = fopen(['dt_count.csv'], 'w');
fwrite(fp, ['Region.Id,Region.Data', sprintf('\n')], 'char');
fwrite(fp, str', 'char');
fclose(fp);

system(['./cartogram -eig maps_carto.json -a dt_count.csv']);

end
