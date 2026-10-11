names = ["ann", "bob", "cy"]
ages = [31, 25, 47]

for (i, (n, a)) in enumerate(zip(names, ages))
    println("$i: $n is $a")
end

lookup = Dict(zip(names, ages))
println(lookup["bob"])

pairs_list = collect(zip(1:3, "abc"))
println(pairs_list)

xs, ys = zip(pairs_list...)
println(xs, " ", ys)
