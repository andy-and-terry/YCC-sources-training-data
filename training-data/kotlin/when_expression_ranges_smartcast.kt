fun f(x: Any): String = when (x) {
    is Int -> if (x in 1..9) "digit" else "int"
    is String -> if (x.isEmpty()) "empty" else "str ${x.length}"
    else -> "other"
}
fun main() = listOf(5, 50, "", "abc", 2.0).forEach { println(f(it)) }
