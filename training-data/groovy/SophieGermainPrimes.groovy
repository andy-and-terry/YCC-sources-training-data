boolean isPrime(long n) {
    n >= 2 && (2L..<(n + 1)).takeWhile { it * it <= n }.every { n % it != 0 }
}

def found = []
long p = 2
while (found.size() < 10) {
    if (isPrime(p) && isPrime(2 * p + 1)) found << p
    p++
}
println found.join(' ') // 2 3 5 11 23 29 41 53 83 89
