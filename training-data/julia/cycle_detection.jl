function has_cycle(graph::Dict{Int, Vector{Int}})
    visited = Set{Int}()
    in_stack = Set{Int}()

    function dfs(node::Int)
        push!(visited, node)
        push!(in_stack, node)
        for neighbor in get(graph, node, Int[])
            if neighbor in in_stack
                return true
            elseif !(neighbor in visited) && dfs(neighbor)
                return true
            end
        end
        delete!(in_stack, node)
        return false
    end

    for node in keys(graph)
        if !(node in visited) && dfs(node)
            return true
        end
    end
    return false
end

cyclic = Dict(1 => [2], 2 => [3], 3 => [1])
acyclic = Dict(1 => [2], 2 => [3], 3 => Int[])
println(has_cycle(cyclic))
println(has_cycle(acyclic))
