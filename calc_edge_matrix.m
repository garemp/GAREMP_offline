function [ edges_matrix ] = calc_edge_matrix( xx, yy, DT )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% Calculate adjacent edges for given node in a triangulated network, save the result in a matrix
% Each row represents all adjacent edges for a node
%
% For a given node N, it is the common vertex for six faces, just like this
%         23  --  9
%        /  \   /  \
%       68 -- N -- 36
%        \  /   \  /
%         80  -- 47
% Six edges connect N and its neighbor vertice
% calc_edge_matrix return a matrix, the Nth row of the matrix is like this 
%     9    23    36    47    68    80     0     0     0     0
% From that row, the neighbor vertice of N is obtained in ascending order with zero filling at tail

edges_matrix = [];
DT_edges = compute_edges(DT);
for i = 1:size(xx, 2)
    ff1 = find(DT_edges(1, :) == i);
    op1 = DT_edges(2, ff1);
    ff2 = find(DT_edges(2, :) == i);
    op2 = DT_edges(1, ff2);
    ff = sort([op1, op2]);
    edges_matrix(end + 1, :) = [ff, zeros(1, 10 - size(ff, 2))];
end

end

