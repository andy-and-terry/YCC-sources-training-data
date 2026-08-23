def power(int base, int exp) {
    if (exp == 0) return 1
    if (exp % 2 == 0) {
        int half = power(base, exp / 2)
        return half * half
    }
    return base * power(base, exp - 1)
}

println power(2, 10)
println power(3, 5)
