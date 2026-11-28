fun stern(count: Int): List<Int> {
    val seq = IntArray(maxOf(count, 2))
    seq[1] = 1
    for (i in 2 until count) {
        seq[i] = if (i % 2 == 0) seq[i / 2] else seq[i / 2] + seq[i / 2 + 1]
    }
    return seq.take(count)
}

fun main() = println(stern(15)) // [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
