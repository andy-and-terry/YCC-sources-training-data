abstract type Shape end
struct Circle <: Shape; r::Float64; end
struct Rect <: Shape; w::Float64; h::Float64; end

area(c::Circle) = π * c.r^2
area(r::Rect) = r.w * r.h
combine(a::Circle, b::Circle) = Circle(sqrt(a.r^2 + b.r^2))
combine(a::Shape, b::Shape) = area(a) + area(b)

println(round(area(Circle(1.0)), digits=3), " ", area(Rect(2, 3)))
println(combine(Circle(3), Circle(4)))
println(combine(Circle(1), Rect(2, 2)))
describe(x::Integer) = "int"
describe(x::AbstractFloat) = "float"
describe(x::AbstractString) = "string"
describe(x) = "other"
println(map(describe, [1, 2.5, "s", :sym]))
println(methods(area) |> length)
