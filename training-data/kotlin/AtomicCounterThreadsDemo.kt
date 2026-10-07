import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.atomic.AtomicLong
import kotlin.concurrent.thread

fun main() {
    val counter = AtomicInteger(0)
    val threads = List(4) {
        thread {
            repeat(1000) { counter.incrementAndGet() }
        }
    }
    threads.forEach { it.join() }
    println("total = ${counter.get()}")

    val max = AtomicLong(Long.MIN_VALUE)
    val workers = (1..4).map { n ->
        thread { max.accumulateAndGet(n * 10L) { a, b -> maxOf(a, b) } }
    }
    workers.forEach { it.join() }
    println("max = ${max.get()}")

    val flag = AtomicInteger(0)
    println(flag.compareAndSet(0, 1))
    println(flag.compareAndSet(0, 2))
    println(flag.getAndAdd(5))
    println(flag.updateAndGet { it * 2 })

    val stop = AtomicBoolean(false)
    val t = thread { while (!stop.get()) Thread.sleep(1) }
    stop.set(true)
    t.join()
    println("stopped")
}
