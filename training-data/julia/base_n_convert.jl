for b in (2, 8, 16, 36)
    println("255 in base $b = ", string(255, base = b))
end
println(parse(Int, "zz", base = 36))
println(tryparse(Int, "9", base = 8))  # nothing
