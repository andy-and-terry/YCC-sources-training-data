a = 0.1 + 0.2
println(a == 0.3)
println(a ≈ 0.3)
println(isapprox(a, 0.3; atol = 1e-12))

println(isapprox(1e10, 1e10 + 1))
println(isapprox(0.0, 1e-10))
println(isapprox(0.0, 1e-10; atol = 1e-8))

println(eps(Float64))
println(nextfloat(1.0) - 1.0)
println(floatmax(Float32), " ", typemax(Int8))
println(isnan(0.0 / 0.0), " ", isinf(1 / 0))
