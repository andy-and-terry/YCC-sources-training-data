area(r::Real) = pi * r^2
area(w::Real, h::Real) = w * h
describe(x::Int) = "int"
describe(x::AbstractFloat) = "float"
println(area(1.0), " ", area(2, 3), " ", describe(1), describe(1.5))
