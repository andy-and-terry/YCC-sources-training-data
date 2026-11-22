// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
fun main() {
    println((0 until 10).joinToString(" ") { n -> (n * (n + 1) / 2 + 1).toString() })
}
