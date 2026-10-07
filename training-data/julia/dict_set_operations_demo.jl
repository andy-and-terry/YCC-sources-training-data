a = Set([1, 2, 3, 4])
b = Set([3, 4, 5, 6])

println(union(a, b))
println(intersect(a, b))
println(setdiff(a, b))
println(symdiff(a, b))

ages = Dict("Alice" => 30, "Bob" => 25, "Carol" => 35)
adults = Dict(name => age for (name, age) in ages if age >= 30)
println(adults)
