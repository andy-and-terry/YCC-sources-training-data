// Emirps: primes whose digit reversal is a different prime.
fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var d = 2
    while (d * d <= n) {
        if (n % d == 0) return false
        d++
    }
    return true
}

fun main() {
    val emirps = (2 until 200).filter { n ->
        val r = n.toString().reversed().toInt()
        r != n && isPrime(n) && isPrime(r)
    }
    println(emirps.joinToString(" "))
}
