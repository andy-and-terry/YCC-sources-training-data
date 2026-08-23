abstract type Shape end

struct Circle <: Shape
    radius::Float64
end

struct Rectangle <: Shape
    width::Float64
    height::Float64
end

area(s::Circle) = π * s.radius^2
area(s::Rectangle) = s.width * s.height

println(area(Circle(4.0)))
println(area(Rectangle(3.0, 5.0)))
