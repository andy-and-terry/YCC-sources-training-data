gcd_all(xs...) = reduce(gcd, xs; init = 0)

println(gcd_all(12, 18, 24))
println(gcd_all(7, 13))
println(gcd([12, 18, 24]))   # built-in vector method
println(lcm(4, 6))
