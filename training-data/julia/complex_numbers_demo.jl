z = 3 + 4im
w = 1 - 2im

println(z + w)
println(z * w)
println(z / w)
println(abs(z), " ", angle(1im))
println(conj(z), " ", real(z), " ", imag(z))
println(z^2)
println(sqrt(Complex(-4)))
println(exp(im * pi) + 1)

roots = [exp(2pi * im * k / 4) for k in 0:3]
println(round.(roots; digits = 3))
