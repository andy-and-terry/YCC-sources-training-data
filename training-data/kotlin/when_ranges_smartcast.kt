fun classify(x: Any): String = when (x) {
    is Int -> when (x) {
        in 0..9 -> "digit"
        in 10..99 -> "two-digit"
        else -> "big"
    }
    is String -> if (x.isEmpty()) "empty" else "text of ${x.length}"
    else -> "unknown"
}

fun main() {
    listOf(5, 42, 1000, "", "abc", 1.5).forEach { println(classify(it)) }
}
