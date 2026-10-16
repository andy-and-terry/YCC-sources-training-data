v = [1, 2, 3, 4, 5]

println(cumsum(v))
println(cumprod(v))
println(accumulate(max, [3, 1, 4, 1, 5, 9, 2]))
println(accumulate(+, v; init = 100))

m = [1 2 3; 4 5 6]
println(cumsum(m; dims = 1))
println(cumsum(m; dims = 2))

running_mean = cumsum(v) ./ (1:length(v))
println(running_mean)
