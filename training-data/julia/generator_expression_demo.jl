# Generator expressions are lazy: no intermediate array is allocated.
total = sum(x^2 for x in 1:10 if iseven(x))
println(total)

gen = (i * j for i in 1:3 for j in 1:3)
println(collect(gen))
println(typeof(gen) <: Base.Generator)

println(any(x -> x > 5, i for i in 1:10))
println(all(isodd(i) for i in 1:2:9))
println(count(c -> c in "aeiou", "generator expression"))
println(maximum(length(w) for w in ["a", "abc", "ab"]))

lazy = Iterators.take((n^2 for n in Iterators.countfrom(1)), 5)
println(collect(lazy))
println(join((string(i) for i in 1:5), "-"))
println(Dict(k => length(k) for k in ["one", "three"]))
