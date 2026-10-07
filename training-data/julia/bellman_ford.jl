function bellman_ford(graph::Dict, source::String, n_vertices::Int)
    dist = Dict(v => typemax(Int) for v in keys(graph))
    dist[source] = 0

    edges = Tuple{String, String, Int}[]
    for (u, neighbors) in graph
        for (v, w) in neighbors
            push!(edges, (u, v, w))
        end
    end

    for _ in 1:(n_vertices - 1)
        for (u, v, w) in edges
            if dist[u] != typemax(Int) && dist[u] + w < dist[v]
                dist[v] = dist[u] + w
            end
        end
    end

    for (u, v, w) in edges
        if dist[u] != typemax(Int) && dist[u] + w < dist[v]
            error("graph contains a negative-weight cycle")
        end
    end

    return dist
end

graph = Dict(
    "a" => [("b", 4), ("c", 5)],
    "b" => [("c", -3)],
    "c" => [("d", 4)],
    "d" => []
)
println(bellman_ford(graph, "a", 4))
