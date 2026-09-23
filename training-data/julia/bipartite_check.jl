function is_bipartite(graph::Dict{Int, Vector{Int}}, num_nodes::Int)
    color = fill(-1, num_nodes)

    for start in 0:(num_nodes - 1)
        if color[start + 1] != -1
            continue
        end
        color[start + 1] = 0
        queue = [start]
        while !isempty(queue)
            node = popfirst!(queue)
            for neighbor in get(graph, node, Int[])
                if color[neighbor + 1] == -1
                    color[neighbor + 1] = 1 - color[node + 1]
                    push!(queue, neighbor)
                elseif color[neighbor + 1] == color[node + 1]
                    return false
                end
            end
        end
    end
    return true
end

even_cycle = Dict(0 => [1, 3], 1 => [0, 2], 2 => [1, 3], 3 => [0, 2])
println(is_bipartite(even_cycle, 4))

odd_cycle = Dict(0 => [1, 2], 1 => [0, 2], 2 => [0, 1])
println(is_bipartite(odd_cycle, 3))
