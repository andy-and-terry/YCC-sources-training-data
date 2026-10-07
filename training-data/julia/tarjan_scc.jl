function tarjan_scc(graph::Dict{Int, Vector{Int}})
    index_counter = Ref(0)
    indices = Dict{Int, Int}()
    lowlinks = Dict{Int, Int}()
    on_stack = Dict{Int, Bool}()
    stack = Int[]
    result = Vector{Vector{Int}}()

    function strongconnect(v::Int)
        indices[v] = index_counter[]
        lowlinks[v] = index_counter[]
        index_counter[] += 1
        push!(stack, v)
        on_stack[v] = true

        for w in get(graph, v, Int[])
            if !haskey(indices, w)
                strongconnect(w)
                lowlinks[v] = min(lowlinks[v], lowlinks[w])
            elseif get(on_stack, w, false)
                lowlinks[v] = min(lowlinks[v], indices[w])
            end
        end

        if lowlinks[v] == indices[v]
            component = Int[]
            while true
                w = pop!(stack)
                on_stack[w] = false
                push!(component, w)
                w == v && break
            end
            push!(result, component)
        end
    end

    for v in keys(graph)
        if !haskey(indices, v)
            strongconnect(v)
        end
    end
    return result
end

graph = Dict(1 => [2], 2 => [3], 3 => [1, 4], 4 => [5], 5 => Int[])
println(tarjan_scc(graph))
