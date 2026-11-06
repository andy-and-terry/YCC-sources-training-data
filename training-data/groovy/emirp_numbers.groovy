// Emirps: primes whose digit reversal is a different prime.
boolean isPrime(int n) {
    n >= 2 && (2..Math.sqrt(n) as int).every { n % it != 0 }
}

int reverse(int n) { n.toString().reverse() as int }

def emirps = (2..<100).findAll { reverse(it) != it && isPrime(it) && isPrime(reverse(it)) }
println emirps.join(' ')
