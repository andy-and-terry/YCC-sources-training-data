struct Pair{A,B}
    first::A
    second::B
end

Base.show(io::IO, p::Pair) = print(io, "(", p.first, ", ", p.second, ")")

swap(p::Pair{A,B}) where {A,B} = Pair{B,A}(p.second, p.first)

struct Stack{T}
    items::Vector{T}
end
Stack{T}() where {T} = Stack{T}(T[])

Base.push!(s::Stack{T}, x::T) where {T} = (push!(s.items, x); s)
Base.length(s::Stack) = length(s.items)

function largest(xs::AbstractVector{T}) where {T<:Real}
    best = first(xs)
    for x in xs
        x > best && (best = x)
    end
    return best
end

p = Pair(1, "one")
println(p, " -> ", swap(p))
println(typeof(p))

s = Stack{Int}()
push!(s, 1); push!(s, 2)
println(length(s))
println(largest([3, 9, 4]), " ", largest([1.5, 0.2]))
