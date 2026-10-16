v = Int[]
push!(v, 1)
push!(v, 2, 3)
append!(v, [4, 5])
println(v)

println(pop!(v))
println(popfirst!(v))
pushfirst!(v, 0)
println(v)

insert!(v, 2, 99)
println(v)
deleteat!(v, 2)
println(v)

splice!(v, 2:3, [7, 8, 9])
println(v)
println(resize!(copy(v), 2))

empty!(v)
println(isempty(v), " ", length(v))
