import kotlinx.coroutines.*

fun main() {
    val handler = CoroutineExceptionHandler { context, throwable ->
        println("caught in ${context[CoroutineName]}: ${throwable.message}")
    }

    val scope = CoroutineScope(SupervisorJob() + handler + CoroutineName("worker"))

    val job = scope.launch {
        throw IllegalStateException("something went wrong")
    }

    runBlocking { job.join() }
    println("main continues after handled failure")
}
