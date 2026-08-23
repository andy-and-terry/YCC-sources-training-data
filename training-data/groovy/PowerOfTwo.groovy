def isPowerOfTwo(int n) {
    return n > 0 && (n & (n - 1)) == 0
}

println isPowerOfTwo(16)
println isPowerOfTwo(18)
