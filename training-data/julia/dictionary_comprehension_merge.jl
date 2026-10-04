squares = Dict(i => i^2 for i in 1:5)
println(squares)

inv = Dict(v => k for (k, v) in squares)
println(inv[16])

a = Dict("x" => 1, "y" => 2)
b = Dict("y" => 20, "z" => 30)
println(merge(a, b))
println(merge(+, a, b))

println(get(a, "q", 0), " ", get!(a, "w", 7), " ", a)
delete!(a, "x")
println(keys(a), " ", collect(values(a)))
println(filter(p -> p.second > 5, a))
println(sort(collect(b), by=last, rev=true))

counts = Dict{Char,Int}()
for ch in "mississippi"
    counts[ch] = get(counts, ch, 0) + 1
end
println(sort(collect(counts)))
println(mapreduce(identity, +, values(counts)))
