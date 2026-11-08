delta_encode(xs) = [xs[1]; diff(xs)]
delta_decode(ds) = cumsum(ds)

d = delta_encode([10, 12, 15, 15, 20])
println(d)
println(delta_decode(d))
