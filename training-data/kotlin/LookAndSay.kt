fun nextTerm(s: String): String = buildString {
    var i = 0
    while (i < s.length) {
        var j = i
        while (j < s.length && s[j] == s[i]) j++
        append(j - i).append(s[i])
        i = j
    }
}

fun main() {
    generateSequence("1", ::nextTerm).take(8).forEach(::println)
}
