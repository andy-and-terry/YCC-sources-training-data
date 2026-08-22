tailrec fun gcd(a: Int, b: Int): Int = if (b == 0) Math.abs(a) else gcd(b, a % b)

fun main() {
    println(gcd(48, 18))
}
