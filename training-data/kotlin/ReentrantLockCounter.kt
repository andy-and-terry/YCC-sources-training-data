import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.thread
import kotlin.concurrent.withLock

class SafeCounter {
    private val lock = ReentrantLock()
    private var value = 0

    fun increment() = lock.withLock { value++ }
    fun get() = lock.withLock { value }
}

fun main() {
    val counter = SafeCounter()
    val threads = List(4) {
        thread { repeat(1000) { counter.increment() } }
    }
    threads.forEach { it.join() }
    println(counter.get())
}
