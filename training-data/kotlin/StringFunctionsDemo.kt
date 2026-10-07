fun main() {
    val s = "  Kotlin, the Pragmatic Language  "
    println(s.trim().lowercase())
    println(s.trim().split(",", " ").filter { it.isNotEmpty() })
    println("kotlin".replaceFirstChar { it.uppercase() })
    println("abc".padStart(6, '*') + "|" + "abc".padEnd(6, '-'))
    println("a-b-c".substringBefore("-") + " " + "a-b-c".substringAfterLast("-"))
    println("racecar".reversed() == "racecar")
    println("hello world".count { it in "aeiou" })
    println("Hello".map { if (it.isUpperCase()) it.lowercaseChar() else it.uppercaseChar() }.joinToString(""))
    println("one two".split(" ").joinToString(separator = "+", prefix = "[", postfix = "]"))
    println("abc".toList() + "xyz".take(2).toList())
    println("a1b22c333".filter { it.isDigit() }.toInt())
    println("text".repeat(2) + "!".repeat(3))
    println("kotlin" in "I love kotlin", "Kotlin".startsWith("Ko"), "x".isBlank())
    println("3.14".toDoubleOrNull() ?: -1.0)
    println("abc".toIntOrNull() ?: -1)
    println("line1\nline2".lines().size)
    println("""
        |multi
        |line
    """.trimMargin())
    val name = "Kt"
    println("Name: $name has ${name.length} chars")
}
