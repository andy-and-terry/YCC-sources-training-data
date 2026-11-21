// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
tailrec fun gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)

fun phi(n: Int): Int = (1..n).count { gcd(it, n) == 1 }

fun isPerfectTotient(n: Int): Boolean {
    var total = 0
    var m = n
    while (m > 1) {
        m = phi(m)
        total += m
    }
    return total == n
}

fun main() {
    println((2 until 200).filter(::isPerfectTotient).joinToString(" "))
}
