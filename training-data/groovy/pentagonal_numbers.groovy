// Pentagonal numbers: n(3n-1)/2.
println((1..10).collect { (it * (3 * it - 1)).intdiv(2) }.join(' '))
