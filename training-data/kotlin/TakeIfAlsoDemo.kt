data class Config(val name: String, val retries: Int)

fun parsePort(s: String): Int? = s.toIntOrNull()?.takeIf { it in 1..65535 }

fun main() {
    println(parsePort("8080"))
    println(parsePort("70000"))
    println(parsePort("abc"))

    println("hello".takeUnless { it.isEmpty() })
    println("".takeUnless { it.isEmpty() })

    val numbers = mutableListOf(3, 1, 2)
    val sorted = numbers
        .also { println("before: $it") }
        .sorted()
        .also { println("after: $it") }
    println(sorted)

    val config = Config("svc", 3)
        .takeIf { it.retries > 0 }
        ?.let { it.copy(name = it.name.uppercase()) }
    println(config)

    val result = run {
        val a = 6
        val b = 7
        a * b
    }
    println(result)

    val sb = StringBuilder().apply {
        append("x")
        append("y")
    }.toString()
    println(sb)

    println(with(listOf(1, 2, 3)) { size + sum() })
    val length = "kotlin".let { it.length }
    println(length)
    println(5.let { it * 2 }.also { println("doubled=$it") } + 1)
}
