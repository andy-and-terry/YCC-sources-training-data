abstract type Shape end

struct Circle <: Shape
    radius::Float64
end

struct Rectangle <: Shape
    width::Float64
    height::Float64
end

area(c::Circle) = pi * c.radius^2
area(r::Rectangle) = r.width * r.height

shapes = Shape[Circle(2.0), Rectangle(3.0, 4.0)]
for s in shapes
    println(area(s))
end
