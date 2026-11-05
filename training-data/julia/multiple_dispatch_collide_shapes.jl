abstract type Shape end
struct Circle <: Shape; r::Float64; end
struct Rect <: Shape; w::Float64; h::Float64; end

area(c::Circle) = π * c.r^2
area(r::Rect) = r.w * r.h
combine(a::Circle, b::Rect) = "circle+rect"
combine(a::Shape, b::Shape) = "generic"

println(area(Rect(3, 4)))
println(combine(Circle(1), Rect(1, 2)), " ", combine(Rect(1, 1), Rect(2, 2)))
