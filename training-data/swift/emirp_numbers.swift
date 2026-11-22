// Emirps: primes whose digit reversal is a different prime.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

let emirps = (2..<200).filter { n in
    let r = Int(String(String(n).reversed()))!
    return r != n && isPrime(n) && isPrime(r)
}
print(emirps.map(String.init).joined(separator: " "))
