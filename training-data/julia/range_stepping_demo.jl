r = 1:10
println(r, " ", length(r), " ", sum(r))
println(collect(1:2:9))
println(collect(10:-3:0))
println(collect(0:0.25:1))
println(range(0, 1, length = 5))
println(collect(range(1, 100, step = 33)))

println(typeof(1:3), " ", typeof(0:0.5:2), " ", typeof(range(0, 1, length = 3)))
println(r[3], " ", r[end], " ", r[2:4])
println(first(r), " ", last(r), " ", step(1:3:10))
println(5 in r, " ", 11 in r, " ", isempty(5:1))
println(reverse(1:5), " ", collect(1:0))

println(sum(i^2 for i in 1:10))
println(collect(Iterators.take(Iterators.countfrom(5, 5), 4)))

for i in 1:3, j in 1:2
    print("($i,$j) ")
end
println()

println(LinRange(0, 10, 5))
println(maximum(abs.(-3:3)))
println(length(0:0.1:1))
println(findall(iseven, 1:10))
println(Int.(round.(range(0, 100, length = 6))))
