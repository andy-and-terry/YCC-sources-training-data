println(factorial(20))
println(typeof(factorial(20)))

big_fact(n) = factorial(big(n))
println(big_fact(30))
println(length(string(big_fact(100))))

println(2^62, " ", 2^64)
println(big(2)^64)

try
    println(factorial(25))
catch e
    println("overflow: ", typeof(e))
end

println(widen(Int32))
println(typemax(Int64) + 1)
