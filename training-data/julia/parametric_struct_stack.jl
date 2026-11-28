mutable struct Stack{T}
    items::Vector{T}
end
Stack{T}() where {T} = Stack{T}(T[])
push_item!(s::Stack, x) = (push!(s.items, x); s)
Base.pop!(s::Stack) = pop!(s.items)

s = Stack{Int}()
push_item!(s, 1); push_item!(s, 2)
println(pop!(s))
