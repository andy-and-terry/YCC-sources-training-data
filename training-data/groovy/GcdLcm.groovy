def gcd(int a, int b) {
    while (b != 0) {
        int t = b
        b = a % b
        a = t
    }
    return Math.abs(a)
}

def lcm(int a, int b) {
    return Math.abs(a * b) / gcd(a, b)
}

println gcd(48, 18)
println lcm(4, 6)
