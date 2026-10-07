function mst = prim_mst(adj, numNodes)
    inTree = false(1, numNodes);
    key = Inf(1, numNodes);
    parent = zeros(1, numNodes);
    key(1) = 0;
    mst = [];
    for count = 1:numNodes
        minKey = Inf;
        u = -1;
        for v = 1:numNodes
            if ~inTree(v) && key(v) < minKey
                minKey = key(v);
                u = v;
            end
        end
        inTree(u) = true;
        if parent(u) ~= 0
            mst = [mst; parent(u) u adj(parent(u), u)];
        end
        for v = 1:numNodes
            if adj(u, v) > 0 && ~inTree(v) && adj(u, v) < key(v)
                key(v) = adj(u, v);
                parent(v) = u;
            end
        end
    end
end

adj = [0 2 0 6; 2 0 3 8; 0 3 0 5; 6 8 5 0];
mst = prim_mst(adj, 4);
disp(mst)
