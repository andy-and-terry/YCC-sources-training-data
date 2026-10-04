fun main() {
    val name = "Kotlin"
    val version = 2
    println("Hello, $name v${version + 0}!")
    println("Length: ${name.length}, upper: ${name.uppercase()}")

    val raw = """
        |Line one
        |  indented $name
        |Price: ${'$'}5
    """.trimMargin()
    println(raw)

    println("a-b-c".split("-").joinToString("+"))
    println("hello world".replaceFirstChar { it.uppercase() })
    println("racecar".reversed() == "racecar")
    println("x".padStart(4, '.') + "|" + "abc".padEnd(5) + "|")
    println("Hello".drop(1).take(3) + " " + "hello".substringAfter("l") + " " + "a.b.c".substringBeforeLast("."))
    println("%05.1f|%-5s|%x".format(3.14159, "ab", 255))
}
