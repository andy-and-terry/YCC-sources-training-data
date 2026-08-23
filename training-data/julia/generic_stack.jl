mutable struct Stack{T}
    items::Vector{T}
    Stack{T}() where T = new(T[])
end

function push_stack!(s::Stack{T}, x::T) where T
    push!(s.items, x)
end

function pop_stack!(s::Stack{T}) where T
    return pop!(s.items)
end

s = Stack{Int}()
push_stack!(s, 1)
push_stack!(s, 2)
push_stack!(s, 3)
println(pop_stack!(s))
println(pop_stack!(s))
