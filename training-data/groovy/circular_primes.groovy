// Circular primes below 100; expect 13.
def isPrime(n) { n > 1 && (2..Math.sqrt(n).toInteger()).every { n % it != 0 } }

def circular(n) {
    def s = n.toString()
    (0..<s.size()).every { isPrime((s.substring(it) + s.substring(0, it)).toInteger()) }
}
println((2..99).count { circular(it) })
