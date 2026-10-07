add1(x) = x + 1
double(x) = 2x
square(x) = x^2

pipeline = square ∘ double ∘ add1
println(pipeline(3))

println(3 |> add1 |> double |> square)

println(map(sqrt ∘ abs, [-4, 9, -16]))
println([1, 2, 3, 4] |> filter(iseven) |> sum)

compose_all(fs...) = foldr(∘, fs)
println(compose_all(add1, double, square)(3))

make_adder(n) = x -> x + n
adders = [make_adder(n) for n in 1:3]
println([f(10) for f in adders])

counter() = (count = 0; () -> (count += 1))
c = counter()
c(); c()
println(c())

curry(f, a) = (args...) -> f(a, args...)
println(curry(+, 5)(10))
println(map(Base.Fix2(^, 2), 1:5))
println(reduce((f, g) -> g ∘ f, [add1, double, add1])(1))
