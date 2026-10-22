fun ulam(count: Int): List<Int> {
    val seq = mutableListOf(1, 2)
    var n = 3
    while (seq.size < count) {
        val candidate = n
        val ways = seq.count { a -> candidate - a > a && (candidate - a) in seq }
        if (ways == 1) seq.add(candidate)
        n++
    }
    return seq
}

fun main() {
    println(ulam(15).joinToString(" "))
}
