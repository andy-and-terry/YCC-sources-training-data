// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
fun isPractical(n: Int): Boolean {
    var reach = 1L // bit i set <=> i is a subset sum
    for (d in 1..n) if (n % d == 0) reach = reach or (reach shl d)
    val mask = (1L shl (n + 1)) - 1
    return reach and mask == mask
}

fun main() {
    println((1..40).filter { isPractical(it) }.joinToString(" "))
}
