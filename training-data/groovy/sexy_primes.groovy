// Sexy primes below 100; expect 16 pairs.
def isPrime(n) { n > 1 && (2..Math.sqrt(n).toInteger()).every { n % it != 0 } }

println((2..99).count { isPrime(it) && isPrime(it + 6) })
