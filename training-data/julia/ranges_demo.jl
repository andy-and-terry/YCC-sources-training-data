r = 1:2:10
println(r, " ", length(r), " ", collect(r))
println(first(r), " ", last(r), " ", step(r))
println(typeof(r))

println(collect(10:-3:0))
println(collect(range(0, 1; length = 5)))
println(LinRange(0, 2, 5))
println(sum(1:100), " ", sum(big(1):big(100)))

println(5 in 1:10, " ", 11 in 1:10)
println(reverse(1:5))
println(r[2:3])
println((1:5) .* 2)
println(isempty(5:1))

for i in Iterators.reverse(1:3)
    print(i, " ")
end
println()
println(collect(Iterators.partition(1:7, 3)))
println(collect(zip(1:3, 'a':'c')))
println(eachindex(["x", "y", "z"]))
println((1:3) == [1, 2, 3])
