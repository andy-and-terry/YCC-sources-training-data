// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
fun isBouncy(n: Int): Boolean {
    val d = n.toString().toList()
    return d != d.sorted() && d != d.sortedDescending()
}

fun main() {
    println((1 until 1000).count(::isBouncy))
}
