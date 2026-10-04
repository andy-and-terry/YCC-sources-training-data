words = ["pear", "Fig", "banana", "apple", "kiwi", "Cherry"]

println(sort(words))
println(sort(words, by = lowercase))
println(sort(words, by = length))
println(sort(words, by = length, rev = true))
println(sort(words, by = w -> (length(w), lowercase(w))))
println(sort(words, lt = (a, b) -> last(a) < last(b)))

nums = [5, 2, 9, 1, 7]
println(sortperm(nums))
println(nums[sortperm(nums, rev = true)])
sort!(nums)
println(nums, " ", issorted(nums))

people = [(name = "Ann", age = 30), (name = "Bob", age = 25), (name = "Cy", age = 30)]
sorted = sort(people, by = p -> (-p.age, p.name))
println([p.name for p in sorted])

println(partialsort([9, 3, 7, 1, 5], 2))
println(sort([3, 1, 2], alg = MergeSort))
println(searchsortedfirst([1, 3, 5, 7], 4), " ", searchsortedlast([1, 3, 5, 7], 4))
println(sort(collect(Dict("b" => 2, "a" => 3, "c" => 1)), by = last))
println(sort([0.5, -1.0, NaN, 2.0]))
