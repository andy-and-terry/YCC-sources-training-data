tailrec fun gcd(a: Long, b: Long): Long = if (b == 0L) a else gcd(b, a % b)

tailrec fun powMod(base: Long, exp: Long, mod: Long, acc: Long = 1): Long = when {
    exp == 0L -> acc
    exp % 2 == 1L -> powMod(base * base % mod, exp / 2, mod, acc * base % mod)
    else -> powMod(base * base % mod, exp / 2, mod, acc)
}

tailrec fun sumDigits(n: Int, acc: Int = 0): Int =
    if (n == 0) acc else sumDigits(n / 10, acc + n % 10)

fun main() {
    println(gcd(1071, 462))
    println(powMod(2, 100, 1_000_000_007))
    println(sumDigits(98765))
}
