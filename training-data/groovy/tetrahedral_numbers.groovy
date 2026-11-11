// Tetrahedral numbers n(n+1)(n+2)/6
def term = { int n -> ((n * (n + 1)) * (n + 2))/6 }

println((0..9).collect { term(it) }.join(' '))
