d = Dict("a" => 3, "b" => 1, "c" => 2)
for (k, v) in sort(collect(d), by=last)
    println(k, "=", v)
end
println(argmax(d)[1] == "a" ? "max a" : "other")
