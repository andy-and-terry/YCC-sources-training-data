words = ["banana", "Apple", "cherry", "fig", "date"]

println(sort(words))
println(sort(words, by=lowercase))
println(sort(words, by=length, rev=true))
println(sort(words, by=w -> (length(w), w)))
println(sortperm(words))

nums = [5, 2, 9, 1]
println(sort(nums, lt=(a, b) -> a > b))
sort!(nums)
println(nums, " ", issorted(nums))
println(searchsortedfirst(nums, 4), " ", searchsortedlast(nums, 5))
println(partialsort([8, 3, 6, 1], 2))
println(argmax([3, 9, 2]), " ", findmin([3, 9, 2]))
println(sort(Dict("a" => 3, "b" => 1), byvalue=true))
