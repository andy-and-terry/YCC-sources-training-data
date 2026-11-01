// Pernicious numbers: the popcount is prime.
boolean isPrime(int n) {
    n >= 2 && (2..<n).takeWhile { it * it <= n }.every { n % it != 0 }
}

println((1..20).findAll { isPrime(Integer.bitCount(it)) }.join(' '))
