function [ s, t ] = fun_edge_curve( nodes, e )
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

