fun wordFrequency(text: String): List<Pair<String, Int>> {
    return text.lowercase().split(Regex("\\s+"))
        .groupingBy { it }
        .eachCount()
        .toList()
        .sortedByDescending { it.second }
}

fun main() {
    val text = "the quick brown fox jumps over the lazy dog the fox runs"
    wordFrequency(text).forEach { (word, count) -> println("$word: $count") }
}
