println(0.1 + 0.2 == 0.3)
println(big"0.1" + big"0.2" == big"0.3")

setprecision(BigFloat, 128) do
    x = sqrt(BigFloat(2))
    println(x)
    println(precision(x))
end

println(precision(BigFloat))
y = BigFloat(1) / 3
println(typeof(y))

println(Float32(1) / 3)
println(Float64(1) / 3)
println(eps(Float32), " ", eps(Float64))
println(nextfloat(1.0))
println(prevfloat(1.0))
