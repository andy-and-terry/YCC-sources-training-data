using Base.Iterators

println(collect(take(1:100, 3)))
println(collect(drop(1:6, 4)))
println(collect(takewhile(x -> x < 4, 1:10)))
println(collect(dropwhile(x -> x < 8, 1:10)))

println(collect(zip(1:3, "abc")))
println(collect(enumerate(["x", "y"])))
println(collect(partition(1:7, 3)))
println(collect(flatten([[1, 2], [3], [4, 5, 6]])))
println(collect(product(1:2, ['a', 'b'])))
println(collect(take(cycle([1, 2, 3]), 7)))
println(collect(take(repeated("z"), 3)))
println(collect(take(countfrom(10, 5), 4)))
println(collect(rest(1:6, 4)))
println(collect(Iterators.reverse(1:4)))
println(collect(Iterators.filter(isodd, 1:10)))
println(collect(Iterators.map(x -> x^2, 1:4)))

struct Squares
    n::Int
end
Base.iterate(s::Squares, i = 1) = i > s.n ? nothing : (i^2, i + 1)
Base.length(s::Squares) = s.n
println(collect(Squares(5)))
println(sum(Squares(10)))
println(collect(zip(Squares(3), countfrom(1))))
