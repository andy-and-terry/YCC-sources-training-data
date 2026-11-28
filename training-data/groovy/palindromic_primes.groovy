boolean isPrime(int n) {
    n >= 2 && (2..Math.sqrt(n) as int).every { n % it != 0 || n == it }
}

println((2..<200).findAll { it.toString() == it.toString().reverse() && isPrime(it) })
// [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
