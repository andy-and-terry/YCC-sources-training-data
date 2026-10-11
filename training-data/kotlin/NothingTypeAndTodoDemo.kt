fun fail(message: String): Nothing = throw IllegalStateException(message)

fun parseAge(text: String): Int {
    val n = text.toIntOrNull() ?: fail("not a number: $text")
    if (n < 0) fail("negative age")
    return n
}

fun main() {
    println(parseAge("30"))
    for (bad in listOf("abc", "-4")) {
        try {
            parseAge(bad)
        } catch (e: IllegalStateException) {
            println("error: ${e.message}")
        }
    }

    val x: Int = if (System.currentTimeMillis() > 0) 7 else error("unreachable")
    println(x)

    try {
        TODO("later")
    } catch (e: NotImplementedError) {
        println(e.message)
    }
}
