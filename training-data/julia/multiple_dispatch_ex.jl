area(r::Float64) = pi * r^2
area(w::Int, h::Int) = w * h
area(s::String) = length(s)

println(area(1.0))
println(area(2, 3))
println(area("abc"))
println(methods(area) |> length)
