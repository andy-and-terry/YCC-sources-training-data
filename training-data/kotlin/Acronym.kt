fun abbreviate(phrase: String): String =
    Regex("[A-Za-z][A-Za-z']*").findAll(phrase).joinToString("") { it.value.first().uppercase() }

fun main() {
    println(abbreviate("Portable Network Graphics"))
    println(abbreviate("Complementary metal-oxide semiconductor"))
}
