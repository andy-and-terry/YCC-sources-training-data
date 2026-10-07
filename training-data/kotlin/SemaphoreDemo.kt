import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit

fun main() = runBlocking {
    val semaphore = Semaphore(permits = 2)
    var current = 0
    var peak = 0

    val jobs = List(5) {
        launch {
            semaphore.withPermit {
                current++
                peak = maxOf(peak, current)
                delay(10)
                current--
            }
        }
    }
    jobs.forEach { it.join() }

    println("peak concurrent workers: $peak")
}
