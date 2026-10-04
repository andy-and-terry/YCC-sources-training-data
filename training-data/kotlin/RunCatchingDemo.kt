fun parsePort(s: String): Int {
    val n = s.toInt()
    require(n in 1..65535) { "port out of range: $n" }
    return n
}

fun main() {
    val ok = runCatching { parsePort("8080") }
    println(ok.isSuccess)
    println(ok.getOrNull())

    val bad = runCatching { parsePort("99999") }
    println(bad.exceptionOrNull()?.message)
    println(bad.getOrDefault(80))

    val notNumber = runCatching { parsePort("abc") }
        .recover { 3000 }
    println(notNumber.getOrThrow())

    val mapped = runCatching { "21".toInt() }
        .map { it * 2 }
        .onSuccess { println("success: $it") }
        .onFailure { println("failed: $it") }
    println(mapped)

    val inputs = listOf("1", "x", "3", "", "5")
    val (good, failed) = inputs.map { runCatching { it.toInt() } }.partition { it.isSuccess }
    println(good.map { it.getOrThrow() })
    println(failed.map { it.exceptionOrNull()!!::class.simpleName })

    val result = runCatching { error("boom") }
        .fold(onSuccess = { "fine" }, onFailure = { "handled ${it.message}" })
    println(result)
}
