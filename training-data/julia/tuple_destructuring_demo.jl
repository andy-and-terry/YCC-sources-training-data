function min_max_mean(xs)
    return minimum(xs), maximum(xs), sum(xs) / length(xs)
end

lo, hi, avg = min_max_mean([4, 8, 15, 16, 23, 42])
println("lo=$lo hi=$hi avg=$avg")

a, b = 1, 2
a, b = b, a
println((a, b))

first_item, rest... = [10, 20, 30, 40]
println(first_item, " ", rest)

(x, y), z = (1, 2), 3
println(x + y + z)

for (i, name) in enumerate(["ann", "bob", "cy"])
    println("$i: $name")
end

for (k, v) in Dict("one" => 1)
    println(k, " => ", v)
end

p = (name = "Ada", age = 36)
(; name, age) = p
println(name, " is ", age)

t = (1, "two", 3.0)
println(typeof(t), " ", length(t), " ", t[2])
println(Tuple([1, 2, 3]), " ", collect((4, 5)))
