function dist = bellman_ford(edges, n, source)
    % edges is an m-by-3 matrix of [u v w] rows (1-indexed nodes).
    dist = Inf(1, n);
    dist(source) = 0;

    for iter = 1:n-1
        for k = 1:size(edges, 1)
            u = edges(k, 1);
            v = edges(k, 2);
            w = edges(k, 3);
            if dist(u) + w < dist(v)
                dist(v) = dist(u) + w;
            end
        end
    end

    for k = 1:size(edges, 1)
        u = edges(k, 1);
        v = edges(k, 2);
        w = edges(k, 3);
        if dist(u) + w < dist(v)
            error('BellmanFord:negativeCycle', 'graph contains a negative-weight cycle');
        end
    end
end

edges = [1 2 4; 1 3 1; 3 2 -2; 2 4 3; 3 4 5];
disp(bellman_ford(edges, 4, 1))
