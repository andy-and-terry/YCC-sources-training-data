for (i, x) in enumerate(["a", "b"]) print(i, x, " ") end
println()
println(collect(zip(1:3, "xyz")), " ", collect(Iterators.partition(1:7, 3)))
println(collect(Iterators.product(1:2, "ab")))
println(first(Iterators.filter(x -> x % 7 == 0, Iterators.countfrom(1)), 3))
println(collect(Iterators.flatten([[1], [2, 3], Int[]])))
println(collect(Iterators.rest(1:5, 3)), " ", collect(Iterators.reverse(1:4)))
struct Fib; n::Int; end
Base.iterate(f::Fib, (a, b, i)=(0, 1, 0)) = i >= f.n ? nothing : (a, (b, a + b, i + 1))
Base.length(f::Fib) = f.n
println(collect(Fib(10)), " ", sum(Fib(10)))
ch = Channel{Int}(5) do c
    for i in 1:4 put!(c, i^2) end
end
println(collect(ch))
println(take!(Channel(c -> put!(c, 99))))
println(sum(i for i in 1:100 if i % 3 == 0), " ", prod(1:5), " ", extrema([3, 1, 4]))
