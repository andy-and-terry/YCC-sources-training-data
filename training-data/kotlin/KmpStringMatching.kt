fun buildLps(pattern: String): IntArray {
    val lps = IntArray(pattern.length)
    var len = 0
    var i = 1
    while (i < pattern.length) {
        if (pattern[i] == pattern[len]) {
            len++
            lps[i] = len
            i++
        } else if (len != 0) {
            len = lps[len - 1]
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
    val matches = kmpSearch("abxabcabcaby", "abcaby")
    println(matches)
}
