struct Vec2
    x::Float64
    y::Float64
end

Base.:+(a::Vec2, b::Vec2) = Vec2(a.x + b.x, a.y + b.y)
Base.:-(a::Vec2, b::Vec2) = Vec2(a.x - b.x, a.y - b.y)
Base.:*(k::Real, v::Vec2) = Vec2(k * v.x, k * v.y)
Base.:*(v::Vec2, k::Real) = k * v
Base.:-(v::Vec2) = Vec2(-v.x, -v.y)
Base.abs(v::Vec2) = hypot(v.x, v.y)
Base.zero(::Type{Vec2}) = Vec2(0, 0)
Base.show(io::IO, v::Vec2) = print(io, "Vec2(", v.x, ", ", v.y, ")")

a = Vec2(1, 2)
b = Vec2(3, 4)
println(a + b)
println(b - a)
println(2 * a)
println(-b)
println(abs(b))
println(sum([a, b, a]; init = zero(Vec2)))
