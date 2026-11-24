// Tetrahedral numbers: n(n+1)(n+2)/6.
fun main() {
    println((1..10).joinToString(" ") { (it * (it + 1) * (it + 2) / 6).toString() })
}
