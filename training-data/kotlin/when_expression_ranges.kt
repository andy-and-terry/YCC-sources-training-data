fun grade(score: Int) = when (score) {
    in 90..100 -> 'A'
    in 80..89 -> 'B'
    in 70 until 80 -> 'C'
    !in 0..100 -> '?'
    else -> 'F'
}

fun describe(x: Any) = when (x) {
    is Int -> if (x > 0) "positive int" else "non-positive int"
    is String -> "string of ${x.length}"
    is List<*> -> "list of ${x.size}"
    else -> "other"
}

fun main() {
    println(listOf(95, 85, 72, 10, 120).map(::grade))
    println(listOf(5, -1, "hey", listOf(1), 2.0).map(::describe))
    val r = when { 1 > 2 -> "no" else -> "fallback" }
    println(r)
}
