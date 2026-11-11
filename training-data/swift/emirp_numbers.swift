// Emirps: primes whose digit reversal is a different prime.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var i = 2
    while i * i <= n {
        if n % i == 0 { return false }
        i += 1
    }
    return true
}

func reverse(_ n: Int) -> Int { Int(String(String(n).reversed()))! }

let emirps = (2..<100).filter { reverse($0) != $0 && isPrime($0) && isPrime(reverse($0)) }
print(emirps)
