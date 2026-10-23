fun vanEck(count: Int): List<Int> {
    val seq = mutableListOf(0)
    val lastSeen = hashMapOf<Int, Int>()
    for (n in 0 until count - 1) {
        val current = seq[n]
        val next = lastSeen[current]?.let { n - it } ?: 0
        lastSeen[current] = n
        seq.add(next)
    }
    return seq
}

fun main() {
    println(vanEck(20).joinToString(" "))
}
