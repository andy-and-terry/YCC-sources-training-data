xs = 1:10

println(mapreduce(x -> x^2, +, xs))
println(reduce(+, xs), " ", reduce(*, 1:5))
println(foldl(-, 1:4), " ", foldr(-, 1:4))
println(reduce(max, [3, 9, 2]))
println(reduce(vcat, [[1, 2], [3], [4, 5]]))
println(reduce((a, b) -> a * 10 + b, [1, 2, 3, 4]))

println(accumulate(+, 1:5))
println(accumulate(max, [3, 1, 4, 1, 5, 9, 2]))
println(cumsum(1:5), " ", cumprod(1:5))

println(sum(abs2, [3, 4]), " ", prod(x -> x + 1, 1:3))
println(any(x -> x > 9, xs), " ", all(isodd, xs))
println(count(iseven, xs), " ", extrema([4, -2, 7]))

words = ["apple", "fig", "banana"]
println(mapreduce(length, +, words))
println(mapreduce(w -> (w, length(w)), (a, b) -> a[2] >= b[2] ? a : b, words))
println(reduce((d, w) -> (d[w[1]] = get(d, w[1], 0) + 1; d), words; init = Dict{Char, Int}()))

println(sum([1.0, 2.0, 3.0] .* [4.0, 5.0, 6.0]))
println(findmax([2, 8, 5]), " ", argmin([2, 8, 5]))
println(foldl((acc, x) -> acc * 2 + x, [1, 0, 1, 1]; init = 0))
