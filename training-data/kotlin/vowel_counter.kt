fun countVowels(s: String): Map<Char, Int> =
    s.lowercase().filter { it in "aeiou" }.groupingBy { it }.eachCount().toSortedMap()

fun main() = println(countVowels("Education is beautiful"))
