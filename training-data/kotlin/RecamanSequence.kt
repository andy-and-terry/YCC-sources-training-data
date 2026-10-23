fun recaman(count: Int): List<Int> {
    val seq = mutableListOf(0)
    val seen = hashSetOf(0)
    for (n in 1 until count) {
        var next = seq[n - 1] - n
        if (next <= 0 || next in seen) next = seq[n - 1] + n
        seen.add(next)
        seq.add(next)
    }
    return seq
}

fun main() {
    println(recaman(20).joinToString(" "))
}
