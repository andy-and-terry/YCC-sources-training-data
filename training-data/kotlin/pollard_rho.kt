tailrec fun gcd(a: Long, b: Long): Long = if (b == 0L) a else gcd(b, a % b)

fun rho(n: Long): Long {
    if (n % 2 == 0L) return 2
    val f = { v: Long -> (v * v + 1) % n }
    var x = 2L; var y = 2L; var d = 1L
    while (d == 1L) {
        x = f(x); y = f(f(y))
        d = gcd(kotlin.math.abs(x - y), n)
    }
    return d
}

fun main() {
    val n = 8051L
    val p = rho(n)
    println("$n = $p * ${n / p}")
}
