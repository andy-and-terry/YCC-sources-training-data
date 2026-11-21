// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
func gcd(_ a: Int, _ b: Int) -> Int { b == 0 ? a : gcd(b, a % b) }

func phi(_ n: Int) -> Int { (1...n).filter { gcd($0, n) == 1 }.count }

func isPerfectTotient(_ n: Int) -> Bool {
    var total = 0, m = n
    while m > 1 {
        m = phi(m)
        total += m
    }
    return total == n
}

print((2..<200).filter(isPerfectTotient).map(String.init).joined(separator: " "))
