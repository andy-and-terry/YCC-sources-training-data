def isPrime(n) {
    if (n < 2) return false
    for (i in 2..(int) Math.sqrt(n)) {
        if (n % i == 0) return false
    }
    return true
}

println (2..20).findAll { isPrime(it) }
