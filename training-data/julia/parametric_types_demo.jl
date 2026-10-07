struct Pair{A,B}
    first::A
    second::B
end

swap(p::Pair{A,B}) where {A,B} = Pair{B,A}(p.second, p.first)

struct Box{T<:Number}
    value::T
end

Base.:+(a::Box{T}, b::Box{T}) where {T} = Box{T}(a.value + b.value)

function largest(xs::Vector{T}) where {T<:Real}
    best = xs[1]
    for x in xs
        x > best && (best = x)
    end
    return best
end

p = Pair(1, "one")
println(typeof(p))
println(swap(p))
println(Box(2) + Box(3))
println(typeof(Box(2.5)))
println(largest([3, 9, 4]))
println(largest([1.5, 0.5]))
println(Vector{Int} <: AbstractVector{Int})
