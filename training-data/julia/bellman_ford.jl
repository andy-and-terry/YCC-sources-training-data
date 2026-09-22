function bellman_ford(n::Int, edges::Vector{Tuple{Int, Int, Int}}, source::Int)
    dist = fill(Inf, n)
    dist[source] = 0.0

    for _ in 1:n-1
        for (u, v, w) in edges
            if dist[u] + w < dist[v]
                dist[v] = dist[u] + w
            end
        end
    end

    for (u, v, w) in edges
        if dist[u] + w < dist[v]
            error("graph contains a negative-weight cycle")
        end
    end

    return dist
end

edges = [(1, 2, 4), (1, 3, 1), (3, 2, -2), (2, 4, 3), (3, 4, 5)]
println(bellman_ford(4, edges, 1))
