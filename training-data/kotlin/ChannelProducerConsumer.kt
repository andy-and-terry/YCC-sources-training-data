import kotlinx.coroutines.*
import kotlinx.coroutines.channels.*

fun CoroutineScope.produceSquares(count: Int): ReceiveChannel<Int> = produce {
    for (i in 1..count) {
        send(i * i)
    }
}

fun main() = runBlocking {
    val channel = produceSquares(5)
    for (value in channel) {
        println(value)
    }

    val results = mutableListOf<Int>()
    val jobs = List(3) { id ->
        launch {
            results.add(id)
        }
    }
    jobs.forEach { it.join() }
    println(results.sorted())
}
