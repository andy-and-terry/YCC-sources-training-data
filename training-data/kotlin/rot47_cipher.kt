fun rot47(s: String) = s.map { c ->
    if (c.code in 33..126) (33 + (c.code - 33 + 47) % 94).toChar() else c
}.joinToString("")

fun main() {
    val e = rot47("Hello, World!")
    println("$e ${rot47(e)}")
}
