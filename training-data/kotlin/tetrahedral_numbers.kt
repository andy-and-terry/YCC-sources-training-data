// Tetrahedral numbers n(n+1)(n+2)/6
fun term(n: Int): Int = ((n * (n + 1)) * (n + 2))/6

fun main() {
    println((0..9).joinToString(" ") { term(it).toString() })
}
