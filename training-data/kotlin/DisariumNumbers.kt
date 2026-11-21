// Disarium numbers: digits raised to their 1-based positions sum to n.
fun isDisarium(n: Int): Boolean =
    n.toString().withIndex().sumOf { (i, c) ->
        var p = 1
        repeat(i + 1) { p *= c - '0' }
        p
    } == n

fun main() {
    println((1 until 1000).filter(::isDisarium).joinToString(" "))
}
