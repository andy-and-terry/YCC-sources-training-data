// Lazy caterer sequence: max pieces from n cuts
fun term(n: Int): Int = ((n * (n + 1))/2) + 1

fun main() {
    println((0..9).joinToString(" ") { term(it).toString() })
}
