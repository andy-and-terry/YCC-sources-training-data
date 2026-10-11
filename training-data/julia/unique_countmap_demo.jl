data = [3, 1, 3, 2, 1, 3, 4]

println(unique(data))
println(allunique(data), " ", allunique([1, 2, 3]))

counts = Dict{Int,Int}()
for x in data
    counts[x] = get(counts, x, 0) + 1
end
for k in sort(collect(keys(counts)))
    println(k, " => ", counts[k])
end

println(sort(collect(counts); by = last, rev = true)[1])
println(count(==(3), data))
println(length(Set(data)))
