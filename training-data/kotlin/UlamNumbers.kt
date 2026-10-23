fun ulam(count: Int): List<Int> {
    val seq = mutableListOf(1, 2)
    var candidate = 3
    while (seq.size < count) {
        var ways = 0
        for (i in seq.indices) {
            for (j in i + 1 until seq.size) {
                if (seq[i] + seq[j] == candidate) ways++
            }
        }
        if (ways == 1) seq.add(candidate)
        candidate++
    }
    return seq
}

fun main() {
    println(ulam(15).joinToString(" "))
}
