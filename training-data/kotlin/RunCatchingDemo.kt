fun parsePositive(s: String): Int {
    val n = s.toInt()
    require(n > 0) { "must be positive: $n" }
    return n
}

fun main() {
    val ok = runCatching { parsePositive("42") }
    println("${ok.isSuccess} ${ok.getOrNull()}")

    val bad = runCatching { parsePositive("-5") }
    println("${bad.isFailure} ${bad.exceptionOrNull()?.message}")

    println(runCatching { parsePositive("abc") }.getOrDefault(0))
    println(runCatching { parsePositive("x") }.getOrElse { -1 })

    val chained = runCatching { "10" }
        .map { it.toInt() * 2 }
        .mapCatching { check(it < 15) { "too big" }; it }
        .recover { 0 }
    println(chained.getOrNull())

    runCatching { parsePositive("7") }
        .onSuccess { println("success $it") }
        .onFailure { println("failure $it") }

    val results = listOf("1", "x", "3").map { runCatching { it.toInt() } }
    println(results.count { it.isSuccess })
    val (good, failed) = results.partition { it.isSuccess }
    println("${good.size} ${failed.size}")
}
