import kotlinx.coroutines.*

suspend fun fetch(n: Int): Int { delay(10); return n * 2 }

fun main() = runBlocking {
    val results = (1..3).map { async { fetch(it) } }.awaitAll()
    println(results)
    val job = launch { try { delay(1000) } finally { println("cancelled cleanup") } }
    delay(20); job.cancelAndJoin()
    println(withTimeoutOrNull(5) { delay(100); "late" })
    coroutineScope { launch { println("child") } }
}
