fun reverseWords(s: String): String {
    val chars = s.toCharArray()
    fun reverse(from: Int, to: Int) {
        var i = from
        var j = to
        while (i < j) {
            val t = chars[i]; chars[i] = chars[j]; chars[j] = t
            i++; j--
        }
    }
    reverse(0, chars.lastIndex)
    var start = 0
    for (i in 0..chars.size) {
        if (i == chars.size || chars[i] == ' ') {
            reverse(start, i - 1)
            start = i + 1
        }
    }
    return String(chars)
}

fun main() {
    println(reverseWords("the sky is blue"))
    println(reverseWords("single"))
}
