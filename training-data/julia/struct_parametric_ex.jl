struct Pair2{T}
    a::T
    b::T
end

Base.:+(p::Pair2, q::Pair2) = Pair2(p.a + q.a, p.b + q.b)
Base.show(io::IO, p::Pair2) = print(io, "<", p.a, ",", p.b, ">")

println(Pair2(1, 2) + Pair2(3, 4))
println(Pair2(1.5, 2.5) + Pair2(1.0, 1.0))
