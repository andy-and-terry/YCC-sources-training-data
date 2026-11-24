// Hexagonal numbers: n(2n-1).
println((1..10).collect { it * (2 * it - 1) }.join(' '))
