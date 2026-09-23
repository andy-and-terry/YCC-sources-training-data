function root = uf_find(parent, x)
    while parent(x) ~= x
        x = parent(x);
    end
    root = x;
end

function parent = uf_union(parent, a, b)
    root_a = uf_find(parent, a);
    root_b = uf_find(parent, b);
    if root_a ~= root_b
        parent(root_a) = root_b;
    end
end

function [mst, total_weight] = kruskal(n, edges)
    sorted_edges = sortrows(edges, 3);
    parent = 1:n;
    mst = [];
    total_weight = 0;

    for e = 1:size(sorted_edges, 1)
        u = sorted_edges(e, 1);
        v = sorted_edges(e, 2);
        w = sorted_edges(e, 3);
        if uf_find(parent, u) ~= uf_find(parent, v)
            parent = uf_union(parent, u, v);
            mst = [mst; u v w];
            total_weight = total_weight + w;
        end
    end
end

edges = [1 2 4; 1 3 3; 2 3 1; 2 4 2; 3 4 4; 4 5 2];
[mst, total_weight] = kruskal(5, edges);
disp(mst)
disp(total_weight)
