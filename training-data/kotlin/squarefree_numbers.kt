// Squarefree numbers up to 100; expect 61.
fun squarefree(n: Int): Boolean {
    var d = 2
    while (d * d <= n) { if (n % (d * d) == 0) return false; d++ }
    return true
}

fun main() {
    println((1..100).count { squarefree(it) })
}
