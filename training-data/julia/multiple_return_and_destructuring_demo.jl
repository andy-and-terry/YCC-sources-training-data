function min_max_mean(xs)
    return minimum(xs), maximum(xs), sum(xs) / length(xs)
end

lo, hi, avg = min_max_mean([4, 8, 15, 16, 23, 42])
println("lo=$lo hi=$hi avg=$avg")

result = min_max_mean([1, 2, 3])
println(typeof(result), " ", result[2])

first, rest... = [1, 2, 3, 4]
println(first, " ", rest)

a, b = "hi"
println(a, b)

x, y = 1, 2
x, y = y, x
println(x, y)

(; name, age) = (name = "Ada", age = 36)
println(name, " ", age)

for (i, (k, v)) in enumerate(Dict(:a => 1))
    println(i, " ", k, " ", v)
end

for (a, b) in zip(1:3, "xyz")
    print(a, b, " ")
end
println()

_, second, _ = (10, 20, 30)
println(second)

quotient, remainder = divrem(17, 5)
println(quotient, " ", remainder)
println(fldmod(-17, 5))
