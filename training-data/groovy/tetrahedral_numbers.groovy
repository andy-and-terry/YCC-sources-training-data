// Tetrahedral numbers: n(n+1)(n+2)/6.
println((1..10).collect { (it * (it + 1) * (it + 2)).intdiv(6) }.join(' '))
