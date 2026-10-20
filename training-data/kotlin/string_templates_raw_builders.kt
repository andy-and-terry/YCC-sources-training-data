fun main() {
    val name = "Ada"; val n = 3
    println("Hello $name, ${n * 2} items, ${name.uppercase().reversed()}")
    val raw = """
        |line one
        |  indented $name
    """.trimMargin()
    println(raw)
    println(buildString { for (i in 1..3) append(i).append(if (i < 3) "-" else "") })
    println("a,b,,c".split(",").filter { it.isNotEmpty() })
    println("%05.1f|%-5s|%x".format(3.14159, "ab", 255))
    println("kotlin".padStart(8, '*') + "kotlin".drop(2).take(3) + "x".repeat(3))
    println("Hello World".lowercase().count { it in "aeiou" })
}
