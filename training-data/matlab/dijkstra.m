function dist = dijkstra(adj, source)
    n = size(adj, 1);
    dist = inf(1, n);
    dist(source) = 0;
    visited = false(1, n);

    for iter = 1:n
        u = -1;
        best = inf;
        for v = 1:n
            if ~visited(v) && dist(v) < best
                best = dist(v);
                u = v;
            end
        end
        if u == -1
            break;
        end
        visited(u) = true;

        for v = 1:n
            w = adj(u, v);
            if w > 0 && dist(u) + w < dist(v)
                dist(v) = dist(u) + w;
            end
        end
    end
end
