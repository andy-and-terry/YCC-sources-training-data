import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock

class SafeCounter {
    private var value = 0
    private val mutex = Mutex()

    suspend fun increment() {
        mutex.withLock {
            value++
        }
    }

    suspend fun get(): Int = mutex.withLock { value }
}

fun main() = runBlocking {
    val counter = SafeCounter()
    val jobs = List(100) {
        launch(Dispatchers.Default) {
            counter.increment()
        }
    }
    jobs.forEach { it.join() }
    println(counter.get())
}
