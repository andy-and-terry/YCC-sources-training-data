// Centered square numbers: n^2 + (n+1)^2.
println((0..<10).collect { it * it + (it + 1) * (it + 1) }.join(' '))
