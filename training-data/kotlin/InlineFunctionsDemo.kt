inline fun <T> measureAndRun(label: String, block: () -> T): T {
    val start = System.nanoTime()
    val result = block()
    val elapsed = System.nanoTime() - start
    println("$label took ${elapsed}ns")
    return result
}

fun main() {
    val sum = measureAndRun("sum") {
        (1..1000).sum()
    }
    println(sum)
}
