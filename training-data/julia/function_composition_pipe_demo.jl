double(x) = 2x
inc(x) = x + 1
square(x) = x^2

println(inc(double(5)))
println(5 |> double |> inc)
println((inc ∘ double)(5))
println((double ∘ inc)(5))

pipeline = square ∘ inc ∘ double
println(pipeline(3))
println(map(pipeline, 1:4))

println([1, 4, 9] .|> sqrt)
println(1:5 |> collect |> sum)
println("  hello  " |> strip |> uppercase)

compose_all(fs...) = foldl(∘, fs)
f = compose_all(sqrt, abs, x -> x - 10)
println(f(1))

add(a) = b -> a + b
println(map(add(10), [1, 2, 3]))
println(filter(iseven, 1:10) |> x -> map(square, x))

curried_pow(p) = x -> x^p
cube = curried_pow(3)
println(cube(3))
println(identity(7), (x -> x)(8))
println(reduce(∘, [inc, inc, inc])(0))
