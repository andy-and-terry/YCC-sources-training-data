p = "apple" => 3
println(p.first, " ", p.second)
println(typeof(p))

d = Dict("a" => 1, "b" => 2)
d["c"] = 3
println(sort(collect(d)))

for (k, v) in sort(collect(d))
    println(k, " -> ", v)
end

println(haskey(d, "a"), " ", get(d, "z", -1))
delete!(d, "a")
println(sort(collect(keys(d))))
println(sum(values(d)))

merged = merge(d, Dict("b" => 20, "x" => 9))
println(sort(collect(merged)))
println(Dict(k => v^2 for (k, v) in d))
