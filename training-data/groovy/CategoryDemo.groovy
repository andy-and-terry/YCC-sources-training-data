class NumberExtras {
    static boolean isPrime(Integer self) {
        if (self < 2) return false
        for (i in 2..<self) {
            if (i * i > self) break
            if (self % i == 0) return false
        }
        return true
    }
}

use(NumberExtras) {
    def primes = (2..20).findAll { it.isPrime() }
    println primes
    println 17.isPrime()
    println 18.isPrime()
}

try {
    println 17.isPrime()
} catch (MissingMethodException e) {
    println "isPrime is not available outside the use() block"
}
