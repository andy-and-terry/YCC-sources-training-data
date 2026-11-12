mutable struct Stack{T}; items::Vector{T}; end
Stack{T}() where {T} = Stack{T}(T[])
push2!(s::Stack{T}, x::T) where {T} = (push!(s.items, x); s)
s = push2!(push2!(Stack{Int}(), 1), 2)
println(s.items, typeof(s))
