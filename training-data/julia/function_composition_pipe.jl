square(x) = x^2
inc(x) = x + 1

f = square ∘ inc
println(f(3))

println(4 |> inc |> square)
println([1, 2, 3] .|> square)
println(map(inc ∘ square, 1:4))

pipeline = reduce(∘, [sqrt, abs, x -> x - 20])
println(pipeline(4))

add(a) = b -> a + b
println(add(2)(5))
println(filter(iseven, 1:10) |> sum)
println((first ∘ reverse)([1, 2, 3]))
