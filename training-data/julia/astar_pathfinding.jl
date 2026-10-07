function astar(graph::Dict, heuristic::Dict, source::String, goal::String)
    g_score = Dict(source => 0)
    frontier = [source]

    while !isempty(frontier)
        sort!(frontier, by = n -> get(g_score, n, typemax(Int)) + get(heuristic, n, 0))
        current = popfirst!(frontier)

        if current == goal
            return g_score[current]
        end

        for (neighbor, weight) in get(graph, current, [])
            tentative = g_score[current] + weight
            if tentative < get(g_score, neighbor, typemax(Int))
                g_score[neighbor] = tentative
                if !(neighbor in frontier)
                    push!(frontier, neighbor)
                end
            end
        end
    end
    return nothing
end

graph = Dict(
    "a" => [("b", 1), ("c", 4)],
    "b" => [("c", 2), ("d", 5)],
    "c" => [("d", 1)],
    "d" => []
)
heuristic = Dict("a" => 2, "b" => 2, "c" => 1, "d" => 0)
println(astar(graph, heuristic, "a", "d"))
