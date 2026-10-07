function floyd_warshall(weights::Matrix{Int})
    n = size(weights, 1)
    dist = copy(weights)

    for k in 1:n
        for i in 1:n
            for j in 1:n
                if dist[i, k] != typemax(Int) && dist[k, j] != typemax(Int) &&
                   dist[i, k] + dist[k, j] < dist[i, j]
                    dist[i, j] = dist[i, k] + dist[k, j]
                end
            end
        end
    end

    return dist
end

const INF = typemax(Int)
weights = [
    0   3   INF INF
    INF 0   1   INF
    INF INF 0   7
    2   INF INF 0
]

result = floyd_warshall(weights)
for row in eachrow(result)
    println(row)
end
