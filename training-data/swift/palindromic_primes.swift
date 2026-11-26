// Palindromic primes below 200; expect 10.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

let found = (2..<200).filter { String($0) == String(String($0).reversed()) && isPrime($0) }
print(found.map(String.init).joined(separator: " "))
print(found.count)
