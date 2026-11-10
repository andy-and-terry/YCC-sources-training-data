boolean isPrime(int n) {
    n >= 2 && (2..<(n + 1)).takeWhile { it * it <= n }.every { n % it != 0 }
}

def pairs = (3..78).findAll { isPrime(it) && isPrime(it + 2) }.collect { "($it,${it + 2})" }
println pairs.join(' ') // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
