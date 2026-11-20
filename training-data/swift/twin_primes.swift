// Twin primes below 50 using a sieve.
var sieve = [Bool](repeating: true, count: 53)
sieve[0] = false; sieve[1] = false
var i = 2
while i * i < 53 {
    if sieve[i] { for j in stride(from: i * i, to: 53, by: i) { sieve[j] = false } }
    i += 1
}
print((2...50).filter { sieve[$0] && sieve[$0 + 2] }.map { ($0, $0 + 2) })
