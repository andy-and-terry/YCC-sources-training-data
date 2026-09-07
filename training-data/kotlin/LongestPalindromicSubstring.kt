fun longestPalindrome(s: String): String {
    if (s.isEmpty()) return ""
    var start = 0
    var maxLen = 1

    fun expand(left: Int, right: Int) {
        var l = left
        var r = right
        while (l >= 0 && r < s.length && s[l] == s[r]) {
            if (r - l + 1 > maxLen) {
                start = l
                maxLen = r - l + 1
            }
            l--
            r++
        }
    }

    for (i in s.indices) {
        expand(i, i)
        expand(i, i + 1)
    }
    return s.substring(start, start + maxLen)
}

fun main() {
    println(longestPalindrome("babad"))
    println(longestPalindrome("cbbd"))
    println(longestPalindrome("racecar"))
}
