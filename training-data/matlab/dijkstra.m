function dist = dijkstra(graph, source)
    n = size(graph, 1);
    dist = Inf(1, n);
    dist(source) = 0;
    visited = false(1, n);

    for count = 1:n
        u = -1;
        best = Inf;
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
            if graph(u, v) > 0 && ~visited(v)
                new_dist = dist(u) + graph(u, v);
                if new_dist < dist(v)
                    dist(v) = new_dist;
                end
            end
        end
    end
end

graph = [0 4 0 0 0 0 0 8 0;
         4 0 8 0 0 0 0 11 0;
         0 8 0 7 0 4 0 0 2;
         0 0 7 0 9 14 0 0 0;
         0 0 0 9 0 10 0 0 0;
         0 0 4 14 10 0 2 0 0;
         0 0 0 0 0 2 0 1 6;
         8 11 0 0 0 0 1 0 7;
         0 0 2 0 0 0 6 7 0];
disp(dijkstra(graph, 1))
