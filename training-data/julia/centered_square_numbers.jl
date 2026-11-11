# Centered square numbers 2n(n+1)+1
term(n) = ((2 * n) * (n + 1)) + 1

println(join(map(term, 0:9), " "))
