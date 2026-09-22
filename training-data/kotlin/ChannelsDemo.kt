import kotlinx.coroutines.*
import kotlinx.coroutines.channels.*

fun CoroutineScope.produceSquares(count: Int): ReceiveChannel<Int> = produce {
    for (i in 1..count) {
        send(i * i)
    }
}

fun main() = runBlocking {
    val squares = produceSquares(5)
    val collected = mutableListOf<Int>()
    for (value in squares) {
        collected.add(value)
    }
    println(collected)

    val jobs = Channel<Int>(capacity = 10)
    val results = Channel<Int>(capacity = 10)

    val workers = List(3) { id ->
        launch {
            for (job in jobs) {
                results.send(job * 2)
            }
        }
    }

    launch {
        for (j in 1..6) jobs.send(j)
        jobs.close()
    }

    launch {
        workers.forEach { it.join() }
        results.close()
    }

    val doubled = results.toList().sorted()
    println(doubled)
}
