using Base.Iterators

println(collect(take(1:100, 5)))
println(collect(drop(1:10, 7)))
println(collect(take(cycle([1, 2, 3]), 8)))
println(collect(takewhile(x -> x < 20, (n^2 for n in 1:100))))
println(collect(dropwhile(x -> x < 5, 1:8)))
println(collect(take(repeated("hi"), 3)))
println(collect(flatten([[1, 2], [3], [4, 5]])))
println(collect(product(1:2, "ab")))
println(first(countfrom(10, 5), 4))
println(collect(Iterators.reverse(1:4)))
