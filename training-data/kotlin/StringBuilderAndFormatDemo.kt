fun main() {
    val sb = StringBuilder()
    sb.append("Kotlin").append(' ').append(2).append(true)
    sb.insert(0, ">> ")
    println(sb)
    sb.setLength(sb.length - 4)
    println(sb.reversed())

    val text = buildString {
        for (i in 1..3) {
            append("item").append(i)
            if (i < 3) append(", ")
        }
    }
    println(text)

    println("%5d|%-5d|%05d".format(42, 42, 42))
    println("%.3f %e".format(Math.PI, 12345.678))
    println("%s has %d chars".format("word", "word".length))
    println("%x %o %b".format(255, 8, true))

    val name = "Ada"
    val n = 3
    println("$name has ${n * 2} items, ${name.length} letters")
    val raw = """
        |first line
        |  second line
    """.trimMargin()
    println(raw)

    println("a-b-c".split("-").joinToString("+", prefix = "[", postfix = "]"))
    println("hello".padStart(8, '*') + "|" + "hello".padEnd(8, '.'))
    println("Hello World".lowercase().replaceFirstChar { it.uppercase() })
}
