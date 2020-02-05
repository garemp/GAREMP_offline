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

end
