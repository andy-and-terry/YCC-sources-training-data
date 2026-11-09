d = Dict("b" => 2, "a" => 1, "c" => 3)
for (k, v) in sort(collect(d))
    println(k, " => ", v)
end
println(haskey(d, "a"), get(d, "z", 0))
