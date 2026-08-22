struct Point
    x::Float64
    y::Float64
end

Base.:+(a::Point, b::Point) = Point(a.x + b.x, a.y + b.y)
Base.show(io::IO, p::Point) = print(io, "($(p.x), $(p.y))")

p1 = Point(1.0, 2.0)
p2 = Point(3.0, 4.0)
println(p1 + p2)
