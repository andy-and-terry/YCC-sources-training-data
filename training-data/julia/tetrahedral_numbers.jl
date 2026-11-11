# Tetrahedral numbers n(n+1)(n+2)/6
term(n) = ((n * (n + 1)) * (n + 2)) ÷ 6

println(join(map(term, 0:9), " "))
