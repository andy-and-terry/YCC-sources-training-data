import java.math.BigInteger
import kotlin.random.Random

fun isProbablyPrime(n: Long, rounds: Int = 20): Boolean {
    if (n < 2) return false
    if (n == 2L || n == 3L) return true
    if (n % 2 == 0L) return false

    var d = n - 1
    var r = 0
    while (d % 2 == 0L) {
        d /= 2
        r++
    }

    repeat(rounds) {
        val a = Random.nextLong(2, n - 2)
        var x = BigInteger.valueOf(a).modPow(BigInteger.valueOf(d), BigInteger.valueOf(n)).toLong()
        if (x != 1L && x != n - 1) {
            var composite = true
            for (j in 0 until r - 1) {
                x = BigInteger.valueOf(x).modPow(BigInteger.valueOf(2), BigInteger.valueOf(n)).toLong()
                if (x == n - 1) {
                    composite = false
                    break
                }
            }
            if (composite) return false
        }
    }
    return true
}

fun main() {
    val candidates = listOf(97L, 561L, 7919L, 100L, 104729L, 1_000_000_007L)
    for (n in candidates) {
        println("$n -> ${isProbablyPrime(n)}")
    }
}
