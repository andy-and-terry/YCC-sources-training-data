# Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
println(join([(n^3 + 5n + 6) ÷ 6 for n in 0:9], " "))
