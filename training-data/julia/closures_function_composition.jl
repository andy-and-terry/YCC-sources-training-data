inc = x -> x + 1
dbl = x -> 2x
println((inc ∘ dbl)(5))
println(map(inc ∘ dbl, 1:3))
adders = [x -> x + i for i in 1:3]
println([f(10) for f in adders])
