fun duval(s: String): List<String> {
    val out = mutableListOf<String>()
    var i = 0
    while (i < s.length) {
        var j = i + 1; var k = i
        while (j < s.length && s[k] <= s[j]) {
            k = if (s[k] < s[j]) i else k + 1
            j++
        }
        while (i <= k) {
            out += s.substring(i, i + j - k)
            i += j - k
        }
    }
    return out
}

fun main() = println(duval("banana"))
