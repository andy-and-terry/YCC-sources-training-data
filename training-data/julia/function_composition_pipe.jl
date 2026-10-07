inc(x) = x + 1
dbl(x) = 2x

println(5 |> inc |> dbl)
println((dbl ∘ inc)(5))
println((inc ∘ dbl)(5))

pipeline = sqrt ∘ abs ∘ (x -> x - 20)
println(pipeline(4))

println([1, 4, 9] .|> sqrt)
println(map(inc ∘ dbl, 1:3))

compose_all(fs...) = foldr(∘, fs)
f = compose_all(inc, dbl, abs)
println(f(-3))

println("hello world" |> uppercase |> split |> reverse |> x -> join(x, " "))

curry(f, a) = b -> f(a, b)
add5 = curry(+, 5)
println(add5(10))
println(filter(!iszero, [0, 1, 0, 2]))
println(Base.Fix2(^, 2)(7))
