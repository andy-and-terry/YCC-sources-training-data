fun isAnagram(a: String, b: String): Boolean {
    if (a.length != b.length) return false
    val counts = IntArray(26)
    for (c in a.lowercase()) counts[c - 'a']++
    for (c in b.lowercase()) counts[c - 'a']--
    return counts.all { it == 0 }
}

fun main() {
    println(isAnagram("listen", "silent"))
    println(isAnagram("hello", "world"))
}
