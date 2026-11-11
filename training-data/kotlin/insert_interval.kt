fun insertInterval(iv: List<Pair<Int, Int>>, new: Pair<Int, Int>): List<Pair<Int, Int>> {
    val out = mutableListOf<Pair<Int, Int>>()
    var merged = new
    var i = 0
    while (i < iv.size && iv[i].second < merged.first) out += iv[i++]
    while (i < iv.size && iv[i].first <= merged.second) {
        merged = minOf(merged.first, iv[i].first) to maxOf(merged.second, iv[i].second)
        i++
    }
    out += merged
    out += iv.drop(i)
    return out
}

fun main() {
    println(insertInterval(listOf(1 to 3, 6 to 9), 2 to 5)) // [(1, 5), (6, 9)]
}
