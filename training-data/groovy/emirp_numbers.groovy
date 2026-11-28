boolean isPrime(int n) {
    n >= 2 && (2..Math.sqrt(n) as int).every { n % it != 0 || n == it }
}

int rev(int n) { n.toString().reverse() as int }

println((2..<200).findAll { rev(it) != it && isPrime(it) && isPrime(rev(it)) })
// [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
