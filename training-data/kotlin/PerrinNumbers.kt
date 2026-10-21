// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
fun main() {
    val p = mutableListOf(3L, 0L, 2L)
    for (n in 3 until 15) p.add(p[n - 2] + p[n - 3])
    println(p.joinToString(" "))
}
