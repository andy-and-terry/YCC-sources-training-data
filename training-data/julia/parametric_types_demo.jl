struct Pair{A,B}
    first::A
    second::B
end

struct Box{T<:Number}
    value::T
end

Base.:+(a::Box{T}, b::Box{T}) where {T} = Box(a.value + b.value)
Base.show(io::IO, b::Box) = print(io, "Box(", b.value, ")")

swap(p::Pair{A,B}) where {A,B} = Pair{B,A}(p.second, p.first)

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
println(Box(1.5) + Box(2.5))
println(largest([3, 9, 4]))
println(largest([2.5, -1.0]))
println(typeof(Box{Int}(4)))
println(Box{Float64} <: Box)
println(isconcretetype(Box{Int}), isconcretetype(Box))
