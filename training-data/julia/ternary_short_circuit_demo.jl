function classify(n)
    return n < 0 ? "negative" : n == 0 ? "zero" : "positive"
end

println(map(classify, [-5, 0, 7]))

function check(x)
    x > 0 || return "non-positive"
    x < 100 && return "small positive"
    return "large"
end
println(check(-1), ", ", check(50), ", ", check(500))

debug = true
debug && println("debug output enabled")
!debug && println("never shown")

function risky(n)
    n >= 0 || throw(ArgumentError("n must be non-negative"))
    return sqrt(n)
end
println(risky(16))

d = Dict("a" => 1)
value = haskey(d, "b") ? d["b"] : -1
println(value)
println(get(d, "b", -1), " ", get!(d, "c", 3), " ", d)

# chained comparisons
x = 5
println(1 < x <= 10)
println(0 < x < 3)

println(isnothing(nothing) ? "is nothing" : "has value")
println(something(nothing, nothing, 42))
println(ifelse(x > 3, "big", "small"))
y = x > 3 && x < 10
println(y)
