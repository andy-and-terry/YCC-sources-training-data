import kotlinx.coroutines.*

suspend fun slowOperation(delayMs: Long): String {
    delay(delayMs)
    return "done after ${delayMs}ms"
}

fun main() = runBlocking {
    val fastResult = withTimeoutOrNull(50) { slowOperation(10) }
    println(fastResult)

    val slowResult = withTimeoutOrNull(20) { slowOperation(100) }
    println(slowResult)

    try {
        withTimeout(20) { slowOperation(100) }
    } catch (e: TimeoutCancellationException) {
        println("timed out: ${e.message}")
    }
}
