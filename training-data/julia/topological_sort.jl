function visit(node, graph, visited, order)
    if node in visited
        return
    end
    push!(visited, node)
    for dep in get(graph, node, [])
        visit(dep, graph, visited, order)
    end
    push!(order, node)
end

function topo_sort(graph::Dict)
    visited = Set()
    order = []
    for node in keys(graph)
        visit(node, graph, visited, order)
    end
    return order
end

graph = Dict("a" => ["b", "c"], "b" => ["d"], "c" => ["d"], "d" => [])
println(topo_sort(graph))
