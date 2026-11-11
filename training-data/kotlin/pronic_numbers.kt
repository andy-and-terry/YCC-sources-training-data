// Pronic numbers n(n+1)
fun term(n: Int): Int = n * (n + 1)

fun main() {
    println((0..9).joinToString(" ") { term(it).toString() })
}
