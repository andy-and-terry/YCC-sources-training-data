fun main() {
    val name = "Kotlin"
    val version = 2
    println("Hello, $name ${version + 0}.${"x".repeat(2)}")

    val sb = StringBuilder()
    for (i in 1..3) sb.append(i).append(',')
    sb.setLength(sb.length - 1)
    println(sb)

    val text = buildString {
        appendLine("line one")
        append("line two")
        insert(0, ">> ")
    }
    println(text)

    val raw = """
        |first
        |  second
    """.trimMargin()
    println(raw)

    println("a-b-c".split("-").reversed().joinToString("+"))
    println("%.2f|%5d|%-5s|".format(3.14159, 42, "ab"))
    println("racecar".reversed() == "racecar")
    println("Hello World".lowercase().count { it in "aeiou" })
}
