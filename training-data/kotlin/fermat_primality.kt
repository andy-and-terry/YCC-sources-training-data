// Fermat primality test; Carmichael number 561 fools it.
import java.math.BigInteger

fun probablyPrime(n: Long): Boolean =
    n > 2 && BigInteger.TWO.modPow(BigInteger.valueOf(n - 1), BigInteger.valueOf(n)) == BigInteger.ONE

fun main() {
    for (n in listOf(97L, 91L, 561L)) println("$n ${probablyPrime(n)}")
}
