// Emirps below 200; expect 15.
def isPrime(n) { n > 1 && (2..Math.sqrt(n).toInteger()).every { n % it != 0 } }

def rev(n) { n.toString().reverse().toInteger() }
def found = (2..199).findAll { rev(it) != it && isPrime(it) && isPrime(rev(it)) }
println "${found.size()} $found"
