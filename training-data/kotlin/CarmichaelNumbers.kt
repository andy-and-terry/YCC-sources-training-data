import java.math.BigInteger

// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
fun isPrime(n: Int): Boolean = n > 1 && (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 }

fun isCarmichael(n: Int): Boolean {
    if (isPrime(n)) return false
    val mod = BigInteger.valueOf(n.toLong())
    return (2 until n).all { a ->
        BigInteger.valueOf(a.toLong()).gcd(mod) != BigInteger.ONE ||
            BigInteger.valueOf(a.toLong()).modPow(BigInteger.valueOf(n - 1L), mod) == BigInteger.ONE
    }
}

fun main() {
    println((3 until 3000 step 2).filter(::isCarmichael).joinToString(" "))
}
