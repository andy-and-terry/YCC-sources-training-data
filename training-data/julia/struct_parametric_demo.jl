struct Pair{T}
    a::T
    b::T
end

swap(p::Pair{T}) where T = Pair{T}(p.b, p.a)
println(swap(Pair(1, 2)))
