mutable struct Stack{T}
    items::Vector{T}
end
Stack{T}() where {T} = Stack{T}(T[])
push!(s::Stack, x) = (Base.push!(s.items, x); s)
Base.length(s::Stack) = length(s.items)

s = Stack{Int}()
push!(s, 1); push!(s, 2)
println(length(s), " ", s.items)
