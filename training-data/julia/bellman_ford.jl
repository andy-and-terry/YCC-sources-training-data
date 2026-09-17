function bellman_ford(n::Int, edges::Vector{Tuple{Int, Int, Int}}, source::Int)
    dist = fill(div(typemax(Int), 2), n)
    dist[source] = 0

    for _ in 1:(n - 1)
        for (u, v, w) in edges
            if dist[u] + w < dist[v]
                dist[v] = dist[u] + w
            end
        end
    end

    has_negative_cycle = false
    for (u, v, w) in edges
        if dist[u] + w < dist[v]
            has_negative_cycle = true
        end
    end

    return dist, has_negative_cycle
end

edges = [(1, 2, -1), (1, 3, 4), (2, 3, 3), (2, 4, 2), (2, 5, 2), (4, 3, 5), (4, 2, 1), (5, 4, -3)]
dist, has_negative_cycle = bellman_ford(5, edges, 1)
println(dist)
println(has_negative_cycle)
