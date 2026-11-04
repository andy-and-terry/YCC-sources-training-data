fun wrap(text: String, width: Int): List<String> {
    val lines = mutableListOf<String>()
    var line = ""
    for (word in text.split(Regex("\\s+"))) {
        if (line.isNotEmpty() && line.length + 1 + word.length > width) {
            lines += line
            line = word
        } else {
            line = if (line.isEmpty()) word else "$line $word"
        }
    }
    if (line.isNotEmpty()) lines += line
    return lines
}

fun main() {
    wrap("the quick brown fox jumps over the lazy dog", 15).forEach { println("|${it.padEnd(15)}|") }
}
