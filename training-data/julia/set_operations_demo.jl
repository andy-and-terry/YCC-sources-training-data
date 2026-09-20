a = Set([1, 2, 3, 4, 5])
b = Set([4, 5, 6, 7])

println(union(a, b))
println(intersect(a, b))
println(setdiff(a, b))
println(issubset(Set([1, 2]), a))

evens = Set(x for x in 1:20 if x % 2 == 0)
println(length(evens))
