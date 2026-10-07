import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.{Executors, TimeUnit}

object AtomicCounterDemo {
  def main(args: Array[String]): Unit = {
    val counter = new AtomicInteger(0)
    val pool = Executors.newFixedThreadPool(4)

    for (_ <- 1 to 4)
      pool.submit(new Runnable {
        def run(): Unit = for (_ <- 1 to 1000) counter.incrementAndGet()
      })

    pool.shutdown()
    pool.awaitTermination(5, TimeUnit.SECONDS)
    println(s"Final count: ${counter.get()}")
    println(counter.compareAndSet(4000, 0))
    println(counter.get())
  }
}
