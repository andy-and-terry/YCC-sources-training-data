private val vowelStart = Regex("^([aeiou]|xr|yt)")
private val consonantStart = Regex("^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$")

fun pigWord(w: String): String {
    if (vowelStart.containsMatchIn(w)) return w + "ay"
    val m = consonantStart.find(w) ?: return w + "ay"
    val (head, tail) = m.destructured
    return tail + head + "ay"
}

fun translate(s: String) = s.lowercase().split(Regex("\\s+")).joinToString(" ", transform = ::pigWord)

fun main() = println(translate("quick fast run apple rhythm square"))
