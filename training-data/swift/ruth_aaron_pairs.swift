// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
func sopfr(_ start: Int) -> Int {
    var n = start
    var total = 0
    var p = 2
    while p * p <= n {
        while n % p == 0 { total += p; n /= p }
        p += 1
    }
    return total + (n > 1 ? n : 0)
}

let out = (2..<110).filter { sopfr($0) == sopfr($0 + 1) }
print(out.map(String.init).joined(separator: " "))
