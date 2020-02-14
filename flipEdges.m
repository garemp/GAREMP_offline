function [  ] = flipEdges( filename, outfile )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% Check for exchanging source and target endpoints of curves 
% It is determined by a metric representing curve-to-node proximity

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

[radium_nocarto, center_nocarto] = ExactMinBoundCircle([xx; yy]');

for j = 1:size(edges, 2)
    e = edges{j};
    if size(e.attributes, 1) == 1 && strcmp(e.attributes{1}, 'curved')
        continue;
    end

    [ s, t ] = fun_edge_curve( nodes, e );
    [x, y] = fun_js_curve(s, t);
    x = (x - center_nocarto(1)) / radium_nocarto * 100;
    y = (y - center_nocarto(2)) / radium_nocarto * 100;
    xt = (xx - center_nocarto(1)) / radium_nocarto * 100;
    yt = (yy - center_nocarto(2)) / radium_nocarto * 100;
    [idx, d] = knnsearch([x; y]', [xt', yt']);
    d = sort(d);
    d = d(3);
    
    [xopp, yopp] = fun_js_curve(t, s);
    x = (xopp - center_nocarto(1)) / radium_nocarto * 100;
    y = (yopp - center_nocarto(2)) / radium_nocarto * 100;
    [idx, d2] = knnsearch([x; y]', [xt', yt']);
    d2 = sort(d2);
    d2 = d2(3);
        
    if (d < d2)
        temp = edges{j}.target;
        edges{j}.target = edges{j}.source;
        edges{j}.source = temp;
    end
end

data.nodes = nodes;
data.edges = edges;

savejson([], data, outfile);

end
