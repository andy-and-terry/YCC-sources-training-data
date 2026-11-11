# Square of the sum minus sum of squares for 1..10 (expect 2640)
xs = 1:10
println(sum(xs)^2 - sum(x^2 for x in xs))
