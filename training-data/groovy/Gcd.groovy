def gcd(a, b) {
    while (b != 0) {
        def temp = b
        b = a % b
        a = temp
    }
    return a
}

println gcd(48, 18)
println gcd(100, 75)
