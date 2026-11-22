// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
println((0..<10).collect { n -> (n * (n + 1)).intdiv(2) + 1 }.join(' '))
