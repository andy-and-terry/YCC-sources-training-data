struct Point{T<:Real}
    x::T
    y::T
end
Base.:+(a::Point, b::Point) = Point(a.x + b.x, a.y + b.y)
Base.show(io::IO, p::Point) = print(io, "Point(", p.x, ", ", p.y, ")")

println(Point(1, 2) + Point(3, 4))
println(Point(1.5, 2.5) + Point(1.0, 1.0))
println(typeof(Point(1, 2)), " ", typeof(Point(1.0, 2.0)))

mutable struct Counter
    n::Int
end
inc!(c::Counter) = (c.n += 1; c)
c = Counter(0)
inc!(inc!(c))
println(c.n)

struct Stack{T}
    items::Vector{T}
end
Stack{T}() where {T} = Stack{T}(T[])
push!(s::Stack, x) = (push!(s.items, x); s)
s = Stack{String}()
push!(s, "a"); push!(s, "b")
println(s.items)
