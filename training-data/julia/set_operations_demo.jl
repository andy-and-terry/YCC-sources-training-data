a = Set([1, 2, 3, 4])
b = Set([3, 4, 5])

println(sort(collect(union(a, b))))
println(sort(collect(intersect(a, b))))
println(sort(collect(setdiff(a, b))))
println(sort(collect(symdiff(a, b))))

println(issubset(Set([1, 2]), a), Set([1, 9]) ⊆ a)
println(isdisjoint(Set([1]), Set([2])))
println(3 in a, 7 ∈ a, 7 ∉ a)

push!(a, 10)
delete!(a, 1)
println(length(a), 10 in a)
println(sort(collect(a)))

words = ["to", "be", "or", "not", "to", "be"]
println(length(unique(words)), length(Set(words)))
println(allunique(words), allunique([1, 2, 3]))

s = Set{String}()
for w in words
    w in s ? println("duplicate: ", w) : push!(s, w)
end

println(sort(collect(a ∪ b)))
println(sort(collect(a ∩ b)))
println(isempty(Set()), Set([1, 2]) == Set([2, 1]))
println(sum(Set([1, 2, 3])), maximum(Set([4, 9, 2])))
