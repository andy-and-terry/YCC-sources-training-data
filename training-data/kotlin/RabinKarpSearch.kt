fun rabinKarpSearch(text: String, pattern: String): List<Int> {
    if (pattern.isEmpty() || pattern.length > text.length) return emptyList()

    val base = 256
    val modulus = 1_000_000_007L
    val m = pattern.length
    var patternHash = 0L
    var windowHash = 0L
    var highOrder = 1L
    repeat(m - 1) { highOrder = (highOrder * base) % modulus }

    for (i in 0 until m) {
        patternHash = (patternHash * base + pattern[i].code) % modulus
        windowHash = (windowHash * base + text[i].code) % modulus
    }

    val matches = mutableListOf<Int>()
    for (i in 0..text.length - m) {
        if (patternHash == windowHash && text.substring(i, i + m) == pattern) {
            matches.add(i)
        }
        if (i < text.length - m) {
            windowHash = (base * (windowHash - text[i].code * highOrder) + text[i + m].code) % modulus
            if (windowHash < 0) windowHash += modulus
        }
    }
    return matches
}

fun main() {
    println(rabinKarpSearch("abxabcabcaby", "abcaby"))
    println(rabinKarpSearch("aaaaa", "aa"))
}
