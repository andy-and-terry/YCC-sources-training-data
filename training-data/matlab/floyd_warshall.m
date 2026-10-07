function dist = floyd_warshall(weights)
    n = size(weights, 1);
    dist = weights;
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
weights = [
    0   3   INF INF;
    INF 0   1   INF;
    INF INF 0   7;
    2   INF INF 0
];

result = floyd_warshall(weights);
disp(result)
