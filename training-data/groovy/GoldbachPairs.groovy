boolean isPrime(int n) { n > 1 && (2..Math.sqrt(n) as int).every { n % it != 0 } }

int n = 28
(2..n.intdiv(2)).findAll { isPrime(it) && isPrime(n - it) }.each { println "$it + ${n - it}" }
