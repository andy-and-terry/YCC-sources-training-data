fun ugly(n: Int): Long {
    val seq = mutableListOf(1L)
    var i2 = 0; var i3 = 0; var i5 = 0
    while (seq.size < n) {
        val next = minOf(seq[i2] * 2, seq[i3] * 3, seq[i5] * 5)
        seq += next
        if (next == seq[i2] * 2) i2++
        if (next == seq[i3] * 3) i3++
        if (next == seq[i5] * 5) i5++
    }
    return seq[n - 1]
}

fun main() = println((1..12).map(::ugly))
