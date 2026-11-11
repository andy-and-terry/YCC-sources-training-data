// Centered square numbers 2n(n+1)+1
def term = { int n -> ((2 * n) * (n + 1)) + 1 }

println((0..9).collect { term(it) }.join(' '))
