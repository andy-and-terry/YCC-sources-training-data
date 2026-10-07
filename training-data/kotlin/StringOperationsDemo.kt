fun main() {
    val text = "  Kotlin makes strings pleasant  "
    println(text.trim().uppercase())
    println(text.trim().split(" ").map { it.replaceFirstChar(Char::uppercase) })

    val s = "hello world"
    println(s.substringBefore(" ") + "|" + s.substringAfter(" "))
    println(s.substringAfterLast("o") + " " + s.indexOf("o") + " " + s.lastIndexOf('o'))
    println(s.reversed() + " " + s.take(5) + " " + s.drop(6))
    println(s.padStart(15, '*') + s.padEnd(15, '-'))
    println(s.count { it in "aeiou" })
    println(s.filter { it.isLetter() }.toSet().sorted().joinToString(""))
    println(s.replace("o", "0").replaceFirstChar { it.uppercase() })

    println("a-b-c".split("-", limit = 2))
    println("racecar".let { it == it.reversed() })
    println("42".toIntOrNull() to "4x".toIntOrNull())
    println("3.5".toDouble() + 1)
    println("abc".compareTo("abd") < 0)
    println("Kotlin".commonPrefixWith("Kotlet"))
    println("line1\nline2\n\nline4".lines().filter { it.isNotBlank() })

    val raw = """
        |first
        |second
    """.trimMargin()
    println(raw)

    val sb = StringBuilder()
    for (i in 1..3) sb.append(i).append(',')
    sb.setLength(sb.length - 1)
    println(sb)
    println(buildString { repeat(3) { append("ab") } })
    println("%.2f and %05d and %s".format(3.14159, 42, "ok"))
}
