// Lazy caterer sequence: max pieces from n cuts
def term = { int n -> ((n * (n + 1))/2) + 1 }

println((0..9).collect { term(it) }.join(' '))
