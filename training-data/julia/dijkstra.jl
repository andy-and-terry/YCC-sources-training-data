function dijkstra(graph::Dict, source::String)
    dist = Dict(n => typemax(Int) for n in keys(graph))
    dist[source] = 0
    visited = Set{String}()

    for _ in 1:length(graph)
        candidates = [(n, d) for (n, d) in dist if !(n in visited)]
        isempty(candidates) && break
        node, node_dist = candidates[argmin([c[2] for c in candidates])]
        push!(visited, node)
        for (neighbor, weight) in get(graph, node, [])
            new_dist = node_dist + weight
            if new_dist < dist[neighbor]
                dist[neighbor] = new_dist
            end
        end
    end
    return dist
end

graph = Dict(
    "a" => [("b", 1), ("c", 4)],
    "b" => [("c", 2), ("d", 5)],
    "c" => [("d", 1)],
    "d" => []
)
println(dijkstra(graph, "a"))
