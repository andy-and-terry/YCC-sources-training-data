fun isIsogram(word: String): Boolean {
    val letters = word.lowercase().filter(Char::isLetter)
    return letters.length == letters.toSet().size
}

fun main() {
    listOf("lumberjacks", "background", "six-year-old", "isograms").forEach { println("$it ${isIsogram(it)}") }
}
