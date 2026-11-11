# Pronic numbers n(n+1)
term(n) = n * (n + 1)

println(join(map(term, 0:9), " "))
