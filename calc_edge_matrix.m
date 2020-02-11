function [ edges_matrix ] = calc_edge_matrix( xx, yy, DT )

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

