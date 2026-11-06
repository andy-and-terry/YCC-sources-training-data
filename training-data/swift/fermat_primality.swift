// Fermat primality test; Carmichael number 561 fools it.
func powmod(_ base: Int, _ exp: Int, _ mod: Int) -> Int {
    var result = 1, b = base % mod, e = exp
    while e > 0 {
        if e & 1 == 1 { result = result * b % mod }
        b = b * b % mod
        e >>= 1
    }
    return result
}

func probablyPrime(_ n: Int) -> Bool { n > 2 && powmod(2, n - 1, n) == 1 }

for n in [97, 91, 561] { print(n, probablyPrime(n)) }
