function dist = floyd_warshall(graph)
    n = size(graph, 1);
    dist = graph;
    for k = 1:n
        for i = 1:n
            for j = 1:n
                if dist(i, k) + dist(k, j) < dist(i, j)
                    dist(i, j) = dist(i, k) + dist(k, j);
                end
            end
        end
    end
end

INF = Inf;
graph = [0 3 INF 7;
         8 0 2 INF;
         5 INF 0 1;
         2 INF INF 0];
disp(floyd_warshall(graph))
