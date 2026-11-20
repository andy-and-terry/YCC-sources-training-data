// Goldbach pair.
def isPrime(int n) { n > 1 && (2..Math.sqrt(n)).every { n % it != 0 } }
def goldbach(int n) { def p = (2..n.intdiv(2)).find { isPrime(it) && isPrime(n - it) }; [p, n - p] }
println goldbach(28)
