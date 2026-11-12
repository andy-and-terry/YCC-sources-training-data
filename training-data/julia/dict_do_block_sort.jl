d = Dict("b" => 2, "a" => 1, "c" => 3)
for (k, v) in sort(collect(d), by = last, rev = true) println(k, v) end
println(get(d, "z", 0))
foreach(keys(d)) do k print(k) end
println()
