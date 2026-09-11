fun buildLps(pattern: String): IntArray {
    val lps = IntArray(pattern.length)
    var length = 0
    var i = 1
    while (i < pattern.length) {
        if (pattern[i] == pattern[length]) {
            length++
            lps[i] = length
            i++
        } else if (length != 0) {
            length = lps[length - 1]
        } else {
            lps[i] = 0
            i++
        }
    }
    return lps
}

fun kmpSearch(text: String, pattern: String): List<Int> {
    if (pattern.isEmpty()) return emptyList()
    val lps = buildLps(pattern)
    val matches = mutableListOf<Int>()
    var i = 0
    var j = 0
    while (i < text.length) {
        if (text[i] == pattern[j]) {
            i++
            j++
            if (j == pattern.length) {
                matches.add(i - j)
                j = lps[j - 1]
            }
        } else if (j != 0) {
            j = lps[j - 1]
        } else {
            i++
        }
    }
    return matches
}

fun main() {
    println(kmpSearch("abxabcabcaby", "abcaby"))
    println(kmpSearch("aaaaa", "aa"))
}
