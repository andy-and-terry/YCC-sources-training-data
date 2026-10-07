function bfs(graph::Dict{Int, Vector{Int}}, start::Int)
    visited = Set{Int}([start])
    order = Int[]
    queue = [start]
    while !isempty(queue)
        node = popfirst!(queue)
        push!(order, node)
        for neighbor in get(graph, node, Int[])
            if !(neighbor in visited)
                push!(visited, neighbor)
                push!(queue, neighbor)
            end
        end
    end
    return order
end

graph = Dict(
    1 => [2, 3],
    2 => [1, 4],
    3 => [1, 4],
    4 => [2, 3, 5],
    5 => [4],
)

println(bfs(graph, 1))
