fun partitionLabels(s: String): List<Int> {
    val last = IntArray(26)
    for ((i, c) in s.withIndex()) last[c - 'a'] = i
    val sizes = mutableListOf<Int>()
    var start = 0
    var end = 0
    for ((i, c) in s.withIndex()) {
        end = maxOf(end, last[c - 'a'])
        if (i == end) {
            sizes += end - start + 1
            start = i + 1
        }
    }
    return sizes
}

fun main() {
    println(partitionLabels("ababcbacadefegdehijhklij"))
    println(partitionLabels("eccbbbbdec"))
}
