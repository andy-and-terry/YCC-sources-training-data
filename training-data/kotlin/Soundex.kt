private val codes = mapOf(
    "bfpv" to '1', "cgjkqsxz" to '2', "dt" to '3', "l" to '4', "mn" to '5', "r" to '6'
).flatMap { (letters, d) -> letters.map { it to d } }.toMap()

fun soundex(word: String): String {
    val w = word.lowercase()
    val out = StringBuilder().append(w[0].uppercaseChar())
    var last = codes[w[0]]
    for (ch in w.drop(1)) {
        val code = codes[ch]
        if (code != null && code != last) out.append(code)
        if (ch != 'h' && ch != 'w') last = code
    }
    return out.toString().padEnd(4, '0').take(4)
}

fun main() {
    listOf("Robert", "Rupert", "Tymczak", "Pfister", "Honeyman").forEach {
        println("$it -> ${soundex(it)}")
    }
}
