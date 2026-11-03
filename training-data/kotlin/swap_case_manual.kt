fun swapCase(s: String): String =
    s.map { if (it.isUpperCase()) it.lowercaseChar() else it.uppercaseChar() }.joinToString("")

fun main() = println(swapCase("Hello World 42"))
