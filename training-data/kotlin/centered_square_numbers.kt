// Centered square numbers 2n(n+1)+1
fun term(n: Int): Int = ((2 * n) * (n + 1)) + 1

fun main() {
    println((0..9).joinToString(" ") { term(it).toString() })
}
