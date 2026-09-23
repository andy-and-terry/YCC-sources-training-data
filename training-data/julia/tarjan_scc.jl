function tarjan_scc(num_nodes::Int, adj::Dict{Int, Vector{Int}})
    index = fill(-1, num_nodes)
    low = fill(-1, num_nodes)
    on_stack = falses(num_nodes)
    stack = Int[]
    sccs = Vector{Vector{Int}}()
    counter = Ref(0)

    function strong_connect(v)
        index[v + 1] = counter[]
        low[v + 1] = counter[]
        counter[] += 1
        push!(stack, v)
        on_stack[v + 1] = true

        for w in get(adj, v, Int[])
            if index[w + 1] == -1
                strong_connect(w)
                low[v + 1] = min(low[v + 1], low[w + 1])
            elseif on_stack[w + 1]
                low[v + 1] = min(low[v + 1], index[w + 1])
            end
        end

        if low[v + 1] == index[v + 1]
            component = Int[]
            while true
                w = pop!(stack)
                on_stack[w + 1] = false
                push!(component, w)
                if w == v
                    break
                end
            end
            push!(sccs, component)
        end
    end

    for v in 0:(num_nodes - 1)
        if index[v + 1] == -1
            strong_connect(v)
        end
    end
    return sccs
end

adj = Dict(0 => [1], 1 => [2, 3], 2 => [0], 3 => [4], 4 => Int[])
println(tarjan_scc(5, adj))
