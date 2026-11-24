// Pentagonal numbers: n(3n-1)/2.
fun main() {
    println((1..10).joinToString(" ") { (it * (3 * it - 1) / 2).toString() })
}
