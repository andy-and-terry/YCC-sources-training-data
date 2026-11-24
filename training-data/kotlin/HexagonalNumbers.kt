// Hexagonal numbers: n(2n-1).
fun main() {
    println((1..10).joinToString(" ") { (it * (2 * it - 1)).toString() })
}
