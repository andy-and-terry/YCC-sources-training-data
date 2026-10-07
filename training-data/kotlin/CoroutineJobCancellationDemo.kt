import kotlinx.coroutines.*

fun main() = runBlocking {
    val job = launch {
        try {
            repeat(10) { i ->
                println("working $i")
                delay(20)
            }
        } finally {
            withContext(NonCancellable) {
                println("cleanup runs even when cancelled")
            }
        }
    }
    delay(50)
    job.cancelAndJoin()
    println("cancelled = ${job.isCancelled}")

    val busy = launch(Dispatchers.Default) {
        var i = 0
        while (isActive) { i++ }
        println("loop observed cancellation")
    }
    delay(10)
    busy.cancel()
    busy.join()

    val parent = launch {
        val child1 = launch { delay(1000); println("never printed") }
        val child2 = launch { delay(10); println("child2 done") }
        child2.join()
        child1.cancel()
    }
    parent.join()

    val lazyJob = launch(start = CoroutineStart.LAZY) { println("lazy started") }
    println("active before start = ${lazyJob.isActive}")
    lazyJob.start()
    lazyJob.join()
}
