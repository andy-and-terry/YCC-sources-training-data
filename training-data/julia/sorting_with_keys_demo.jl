words = ["banana", "Apple", "cherry", "date", "fig"]

println(sort(words))
println(sort(words, by=lowercase))
println(sort(words, by=length))
println(sort(words, by=length, rev=true))
println(sort(words, by=w -> (length(w), w)))
println(sortperm(words, by=length))

nums = [5, 2, 8, 1, 9]
println(sort(nums, rev=true))
println(sort!(copy(nums)))
println(issorted(sort(nums)))
println(partialsort(nums, 1:2))
println(searchsortedfirst(sort(nums), 6))

people = [(name="Ann", age=30), (name="Bob", age=25), (name="Cy", age=30)]
println(sort(people, by=p -> (-p.age, p.name)))
println(map(p -> p.name, sort(people, by=p -> p.age)))

println(sort([3, 1, 2], lt=(a, b) -> a > b))
println(sort(["b", "a"], alg=MergeSort))
println(argmax(nums), argmin(nums))
println(first(sort(nums, rev=true), 3))
println(sort(Dict("z" => 1, "a" => 2)))
