import kotlinx.coroutines.*

fun main() = runBlocking {
    val handler = CoroutineExceptionHandler { _, e ->
        println("caught: ${e.message}")
    }
    val results = mutableListOf<String>()

    supervisorScope {
        launch(handler) {
            throw RuntimeException("boom")
        }
        launch(handler) {
            delay(10)
            results.add("sibling finished normally")
        }
    }

    println(results)
}
