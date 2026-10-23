fun kolakoski(count: Int): List<Int> {
    val seq = mutableListOf(1, 2, 2)
    var i = 2
    while (seq.size < count) {
        val value = if (i % 2 == 0) 1 else 2
        repeat(seq[i]) { seq.add(value) }
        i++
    }
    return seq.take(count)
}

fun main() {
    println(kolakoski(20).joinToString(" "))
}
