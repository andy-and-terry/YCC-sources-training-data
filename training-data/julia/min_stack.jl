mutable struct MinStack
    items::Vector{Int}
    mins::Vector{Int}
    MinStack() = new(Int[], Int[])
end

function push_min!(s::MinStack, x::Int)
    push!(s.items, x)
    push!(s.mins, isempty(s.mins) ? x : min(x, s.mins[end]))
end

function pop_min!(s::MinStack)
    pop!(s.mins)
    return pop!(s.items)
end

get_min(s::MinStack) = s.mins[end]

s = MinStack()
push_min!(s, 5)
push_min!(s, 2)
push_min!(s, 8)
println(get_min(s))
pop_min!(s)
println(get_min(s))
