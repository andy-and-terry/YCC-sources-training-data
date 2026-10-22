// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
fun main() {
    val n = mutableListOf(1L, 1L, 1L)
    for (i in 3 until 15) n.add(n[i - 1] + n[i - 3])
    println(n.joinToString(" "))
}
