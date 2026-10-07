function is_safe(graph::Dict{Int, Vector{Int}}, colors::Vector{Int}, vertex::Int, c::Int)
    for neighbor in get(graph, vertex, Int[])
        if colors[neighbor + 1] == c
            return false
        end
    end
    return true
end

function color_graph!(graph::Dict{Int, Vector{Int}}, m::Int, colors::Vector{Int}, vertex::Int, n::Int)
    if vertex == n
        return true
    end
    for c in 0:(m - 1)
        if is_safe(graph, colors, vertex, c)
            colors[vertex + 1] = c
            if color_graph!(graph, m, colors, vertex + 1, n)
                return true
            end
            colors[vertex + 1] = -1
        end
    end
    return false
end

graph = Dict(0 => [1, 2], 1 => [0, 2], 2 => [0, 1, 3], 3 => [2])
n = 4

colors = fill(-1, n)
println(color_graph!(graph, 3, colors, 0, n))
println(colors)

colors = fill(-1, n)
println(color_graph!(graph, 2, colors, 0, n))
