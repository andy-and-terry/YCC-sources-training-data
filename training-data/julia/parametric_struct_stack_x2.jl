mutable struct Stack{T}
    items::Vector{T}
end
Stack{T}() where {T} = Stack{T}(T[])
push!(s::Stack, x) = (push!(s.items, x); s)

s = Stack{Int}()
push!(s, 1); push!(s, 2)
println(s.items)
