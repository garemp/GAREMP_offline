function [ s, t ] = fun_edge_curve( nodes, e )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% find the source node 's' and target node 't' for given edge 'e'

s = [];
t = [];
for j = 1:size(nodes, 2)
    n = nodes{j};
    if str2num(n.id) == str2num(e.source)
        s = n;
        break;
    end
end
for j = 1:size(nodes, 2)
    n = nodes{j};
    if str2num(n.id) == str2num(e.target)
        t = n;
        break;
    end
end

end

