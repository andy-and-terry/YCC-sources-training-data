import java.util.concurrent.Callable
import java.util.concurrent.CountDownLatch
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit

fun main() {
    val pool = Executors.newFixedThreadPool(3)

    val futures = (1..5).map { n ->
        pool.submit(Callable { n * n })
    }
    println(futures.map { it.get() })

    val tasks = listOf(Callable { "a" }, Callable { "b" }, Callable { "c" })
    println(pool.invokeAll(tasks).map { it.get() })

    val latch = CountDownLatch(3)
    repeat(3) {
        pool.execute { latch.countDown() }
    }
    latch.await()
    println("latch released")

    val failing = pool.submit(Callable<Int> { error("task failed") })
    try {
        failing.get()
    } catch (e: java.util.concurrent.ExecutionException) {
        println("cause: ${e.cause?.message}")
    }

    pool.shutdown()
    println(pool.awaitTermination(1, TimeUnit.SECONDS))
}
