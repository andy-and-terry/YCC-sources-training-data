function dist = bellman_ford(num_nodes, edges, source)
    dist = Inf(1, num_nodes);
    dist(source) = 0;

    for i = 1:(num_nodes - 1)
        for e = 1:size(edges, 1)
            u = edges(e, 1);
            v = edges(e, 2);
            w = edges(e, 3);
            if dist(u) + w < dist(v)
                dist(v) = dist(u) + w;
            end
        end
    end

    for e = 1:size(edges, 1)
        u = edges(e, 1);
        v = edges(e, 2);
        w = edges(e, 3);
        if dist(u) + w < dist(v)
            error('BellmanFord:negativeCycle', 'graph contains a negative-weight cycle');
        end
    end
end

edges = [1 2 4; 1 3 5; 2 3 -3; 3 4 4];
disp(bellman_ford(4, edges, 1))
