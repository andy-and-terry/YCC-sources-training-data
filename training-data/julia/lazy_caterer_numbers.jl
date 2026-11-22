# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
println(join([n * (n + 1) ÷ 2 + 1 for n in 0:9], " "))
