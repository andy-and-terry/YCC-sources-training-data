struct Stack{T}
    items::Vector{T}
end
Stack{T}() where {T} = Stack{T}(T[])
push!(s::Stack, x) = (Base.push!(s.items, x); s)
Base.pop!(s::Stack) = Base.pop!(s.items)

s = Stack{Int}()
push!(s, 1); push!(s, 2)
println(pop!(s), " ", length(s.items))
