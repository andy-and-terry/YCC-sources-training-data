// Centered square numbers: n^2 + (n+1)^2.
fun main() {
    println((0 until 10).joinToString(" ") { (it * it + (it + 1) * (it + 1)).toString() })
}
