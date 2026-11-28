boolean isPronic(long x) {
    long n = Math.sqrt(x as double) as long
    return n * (n + 1) == x
}

println((0..<10).collect { it * (it + 1) }) // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
println([isPronic(56), isPronic(57)])       // [true, false]
