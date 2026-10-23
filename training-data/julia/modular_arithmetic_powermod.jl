println(powermod(2, 100, 1_000_000_007))
println(powermod(3, 0, 7))

println(invmod(3, 11))
println(mod(3 * invmod(3, 11), 11))

p = 101
a = 37
println(powermod(a, p - 2, p) == invmod(a, p))
println(powermod(a, p - 1, p))

println(mod(-7, 3))
println(rem(-7, 3))
println(divrem(17, 5))
println(fldmod(-17, 5))
