// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
func gcd(_ a: Int, _ b: Int) -> Int { b == 0 ? a : gcd(b, a % b) }

func powMod(_ base: Int, _ exp: Int, _ m: Int) -> Int {
    var r = 1, b = base % m, e = exp
    while e > 0 {
        if e & 1 == 1 { r = r * b % m }
        b = b * b % m
        e >>= 1
    }
    return r
}

func isPrime(_ n: Int) -> Bool {
    var p = 2
    while p * p <= n {
        if n % p == 0 { return false }
        p += 1
    }
    return n > 1
}

func isCarmichael(_ n: Int) -> Bool {
    if isPrime(n) { return false }
    return (2..<n).allSatisfy { gcd($0, n) != 1 || powMod($0, n - 1, n) == 1 }
}

print(stride(from: 3, to: 3000, by: 2).filter(isCarmichael).map(String.init).joined(separator: " "))
