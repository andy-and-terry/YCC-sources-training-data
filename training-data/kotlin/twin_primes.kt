// Twin primes below 50 using a sieve.
fun main() {
    val s = BooleanArray(53) { it >= 2 }
    var i = 2
    while (i * i < 53) { if (s[i]) for (j in i * i until 53 step i) s[j] = false; i++ }
    println((2..50).filter { s[it] && s[it + 2] }.map { it to it + 2 })
}
