// Pronic numbers n(n+1)
def term = { int n -> n * (n + 1) }

println((0..9).collect { term(it) }.join(' '))
