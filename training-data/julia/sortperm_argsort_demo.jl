scores = [88, 92, 75, 92, 60]
names = ["ann", "bob", "cy", "di", "ed"]

order = sortperm(scores; rev = true)
println(order)
println(names[order])
println(scores[order])

println(sortperm(scores; alg = MergeSort))

words = ["pear", "fig", "banana", "kiwi"]
println(sort(words; by = length))
println(sort(words; by = w -> (length(w), w)))

v = [3, 1, 2]
p = sortperm(v)
println(invperm(p))
