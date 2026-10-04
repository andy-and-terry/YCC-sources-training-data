abstract type Shape end

struct Circle <: Shape
    r::Float64
end

struct Rect <: Shape
    w::Float64
    h::Float64
end

struct Blob <: Shape end

area(c::Circle) = pi * c.r^2
area(r::Rect) = r.w * r.h
area(s::Shape) = error("area not implemented for $(typeof(s))")

describe(s::Shape) = "$(nameof(typeof(s))) with area $(round(area(s), digits=2))"

shapes = Shape[Circle(1.0), Rect(2.0, 3.5)]
for s in shapes
    println(describe(s))
end

println(sum(area, shapes))

try
    area(Blob())
catch e
    println(sprint(showerror, e))
end

println(subtypes(Shape))
println(Circle <: Shape, supertype(Circle), isabstracttype(Shape))
println(hasmethod(area, Tuple{Circle}))
