// Deficient numbers below 100; expect 76.
fun properSum(n: Int): Int = (1 until n).filter { n % it == 0 }.sum()

fun main() {
    println((1 until 100).count { properSum(it) < it })
}
