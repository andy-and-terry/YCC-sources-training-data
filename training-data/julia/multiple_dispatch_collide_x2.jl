abstract type Shape end
struct Circle <: Shape; r::Float64; end
struct Square <: Shape; s::Float64; end

area(c::Circle) = π * c.r^2
area(s::Square) = s.s^2
collide(a::Circle, b::Square) = "circle hits square"
collide(a::Shape, b::Shape) = "generic"

println(area(Circle(1.0)), " ", collide(Circle(1.0), Square(2.0)))
