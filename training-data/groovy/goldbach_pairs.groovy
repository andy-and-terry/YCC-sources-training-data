// Goldbach partitions of 100; expect 6.
def isPrime(n) { n > 1 && (2..Math.sqrt(n).toInteger()).every { n % it != 0 } }

def pairs = (2..50).findAll { isPrime(it) && isPrime(100 - it) }.collect { [it, 100 - it] }
println "${pairs.size()} $pairs"
