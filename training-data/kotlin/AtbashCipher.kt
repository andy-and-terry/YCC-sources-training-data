object Atbash {
    fun decode(text: String): String = text.lowercase()
        .filter { it.isLetterOrDigit() }
        .map { if (it in 'a'..'z') 'z' - (it - 'a') else it }
        .joinToString("")

    fun encode(text: String): String = decode(text).chunked(5).joinToString(" ")
}

fun main() {
    val e = Atbash.encode("The quick brown fox")
    println("$e -> ${Atbash.decode(e)}")
}
