boolean isPrime(int n) { n >= 2 && (2..Math.sqrt(n)).every { n % it != 0 || it == n } }
int rev(int n) { n.toString().reverse() as int }

println((2..<100).findAll { isPrime(it) && rev(it) != it && isPrime(rev(it)) })
