function root = kf_find(parent, x)
    root = x;
    while parent(root) ~= root
        root = parent(root);
    end
end

function parent = kf_union(parent, x, y)
    rootX = kf_find(parent, x);
    rootY = kf_find(parent, y);
    if rootX ~= rootY
        parent(rootX) = rootY;
    end
end

function mst = kruskal_mst(edges, numNodes)
    [~, order] = sort(edges(:, 3));
    sortedEdges = edges(order, :);
    parent = 1:numNodes;
    mst = [];
    for e = 1:size(sortedEdges, 1)
        u = sortedEdges(e, 1); v = sortedEdges(e, 2); w = sortedEdges(e, 3);
        if kf_find(parent, u) ~= kf_find(parent, v)
            parent = kf_union(parent, u, v);
            mst = [mst; u v w];
        end
    end
end

edges = [1 2 1; 2 3 3; 1 3 2; 3 4 4];
mst = kruskal_mst(edges, 4);
disp(mst)
