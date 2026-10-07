words = ["banana", "kiwi", "apple", "fig", "cherry"]

println(sort(words))
println(sort(words; by = length))
println(sort(words; by = length, rev = true))
println(sort(words; lt = (a, b) -> last(a) < last(b)))

# Multi-key sort using tuples
println(sort(words; by = w -> (length(w), w)))

nums = [30, 10, 20]
idx = sortperm(nums)
println(idx, " ", nums[idx])

v = [5, 2, 9, 1]
sort!(v)
println(v, " ", issorted(v))
println(partialsort([5, 2, 9, 1, 7], 2))
println(searchsortedfirst(v, 6), " ", searchsortedlast(v, 6))
println(sort([3, 1, 2]; alg = MergeSort))
