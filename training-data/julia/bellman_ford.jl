function bellman_ford(num_nodes::Int, edges::Vector{Tuple{Int,Int,Int}}, source::Int)
    dist = fill(Inf, num_nodes)
    dist[source] = 0.0

    for _ in 1:(num_nodes - 1)
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

edges = [(1, 2, 4), (1, 3, 5), (2, 3, -3), (3, 4, 4)]
println(bellman_ford(4, edges, 1))
