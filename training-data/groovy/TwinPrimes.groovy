boolean isPrime(int n) { n > 1 && (2..Math.sqrt(n) as int).every { n % it != 0 } }

println (3..48).findAll { isPrime(it) && isPrime(it + 2) }.collect { [it, it + 2] }
