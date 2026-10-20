import java.util.concurrent.atomic.AtomicInteger
import kotlin.concurrent.thread

fun main() {
    var plain = 0
    val atomic = AtomicInteger()
    val lock = Any()
    val ts = List(4) { thread { repeat(1000) { synchronized(lock) { plain++ }; atomic.incrementAndGet() } } }
    ts.forEach { it.join() }
    println("$plain ${atomic.get()}")
}
