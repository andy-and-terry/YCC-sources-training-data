abstract type Shape end
struct Circle <: Shape; r::Float64; end
struct Square <: Shape; s::Float64; end

collide(a::Circle, b::Circle) = "circle-circle"
collide(a::Circle, b::Square) = "circle-square"
collide(a::Square, b::Circle) = collide(b, a)
collide(a::Shape, b::Shape) = "generic"

println(collide(Square(1), Circle(2)))
println(collide(Square(1), Square(2)))
