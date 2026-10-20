tailrec fun gcd(a: Long, b: Long): Long = if (b == 0L) a else gcd(b, a % b)
tailrec fun sumTo(n: Long, acc: Long = 0): Long = if (n == 0L) acc else sumTo(n - 1, acc + n)

val memo = HashMap<Int, Long>()
fun fib(n: Int): Long = if (n < 2) n.toLong() else memo.getOrPut(n) { fib(n - 1) + fib(n - 2) }

fun main() {
    println(gcd(48, 18))
    println(sumTo(1_000_000))
    println(fib(80))
}
