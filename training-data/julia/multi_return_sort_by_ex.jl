words = ["pear", "fig", "banana", "kiwi"]
println(sort(words; by=length))
println(sort(words; by=length, rev=true))
println(sortperm(words))
println(argmax(length.(words)))
