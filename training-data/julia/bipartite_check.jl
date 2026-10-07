function is_bipartite(graph::Dict{Int, Vector{Int}})
    colors = Dict{Int, Int}()

    for start in keys(graph)
        if haskey(colors, start)
            continue
        end
        colors[start] = 0
        queue = [start]
        while !isempty(queue)
            node = popfirst!(queue)
            for neighbor in get(graph, node, Int[])
                if !haskey(colors, neighbor)
                    colors[neighbor] = 1 - colors[node]
                    push!(queue, neighbor)
                elseif colors[neighbor] == colors[node]
                    return false
                end
            end
        end
    end
    return true
end

bipartite = Dict(0 => [1, 3], 1 => [0, 2], 2 => [1, 3], 3 => [0, 2])
not_bipartite = Dict(0 => [1, 2], 1 => [0, 2], 2 => [0, 1])
println(is_bipartite(bipartite))
println(is_bipartite(not_bipartite))
