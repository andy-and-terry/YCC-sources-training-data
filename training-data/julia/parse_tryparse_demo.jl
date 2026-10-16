println(parse(Int, "42"))
println(parse(Float64, "3.5e2"))
println(parse(Int, "ff"; base = 16))
println(parse(Int, "-101"; base = 2))

for text in ["12", "1.5", "abc", ""]
    n = tryparse(Int, text)
    println(repr(text), " => ", n === nothing ? "not an int" : n)
end

try
    parse(Int, "12x")
catch e
    println(typeof(e))
end

println(something(tryparse(Float64, "oops"), 0.0))
println(string(255, base = 2), " ", string(255, base = 16))
