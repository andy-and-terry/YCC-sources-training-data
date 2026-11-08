abstract type Shape end
struct Circle <: Shape; r::Float64; end
struct Square <: Shape; s::Float64; end

area(c::Circle) = pi * c.r^2
area(s::Square) = s.s^2
overlap(a::Shape, b::Shape) = "generic overlap"
overlap(a::Circle, b::Circle) = "circle-circle"

println(area(Circle(1)), " ", area(Square(2)))
println(overlap(Circle(1), Circle(2)))
println(overlap(Circle(1), Square(2)))
