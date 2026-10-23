struct Pair2{T}
    first::T
    second::T
end

swap(p::Pair2{T}) where {T} = Pair2{T}(p.second, p.first)

function largest(xs::Vector{T}) where {T<:Real}
    m = xs[1]
    for x in xs
        x > m && (m = x)
    end
    m
end

println(swap(Pair2(1, 2)))
println(swap(Pair2("a", "b")))
println(largest([3, 9, 4]))
println(largest([2.5, 1.5]))
