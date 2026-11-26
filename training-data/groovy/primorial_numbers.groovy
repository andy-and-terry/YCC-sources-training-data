// Primorials up to 1e6, including 1; expect 8.
def isPrime(n) { n > 1 && (2..Math.sqrt(n).toInteger()).every { n % it != 0 } }

def values = [1L]
long acc = 1
int p = 2
while (true) {
    if (isPrime(p)) {
        acc *= p
        if (acc > 1000000) break
        values << acc
    }
    p++
}
println "${values.size()} $values"
