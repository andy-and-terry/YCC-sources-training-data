d = Dict("a" => 1, "b" => 2)
d["c"] = 3
println(get(d, "z", 0), " ", haskey(d, "a"), " ", length(d), " ", sort(collect(keys(d))))
for (k, v) in sort(collect(d)) print(k, "=", v, " ") end
println()
println(merge(d, Dict("a" => 100)), " ", delete!(copy(d), "a") |> length)
counts = Dict{Char,Int}()
for c in "mississippi" counts[c] = get(counts, c, 0) + 1 end
println(sort(collect(counts), by=last, rev=true))
s = Set([1, 2, 3, 2])
println(length(s), " ", 2 in s, " ", union(s, Set([9])), " ", intersect(s, Set([2, 3, 4])), " ", setdiff(s, Set([1])))
t = (1, "two", 3.0)
a, b, c = t
println(a, b, c, " ", t[2], " ", typeof(t))
nt = (name="Ada", age=36)
println(nt.name, " ", nt[:age], " ", keys(nt), " ", merge(nt, (age=37,)))
println(Dict(zip([:x, :y], [1, 2])), " ", [k for (k, v) in d if v > 1] |> sort)
