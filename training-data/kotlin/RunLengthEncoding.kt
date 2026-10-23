fun encode(s: String): String =
    Regex("(.)\\1*").findAll(s).joinToString("") { "${it.value.length}${it.value[0]}" }

fun decode(s: String): String =
    Regex("(\\d+)(\\D)").replace(s) { it.groupValues[2].repeat(it.groupValues[1].toInt()) }

fun main() {
    val text = "WWWWWWBBBWWCDDDDD"
    val enc = encode(text)
    println(enc)
    println(decode(enc) == text)
}
