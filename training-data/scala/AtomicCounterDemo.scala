import java.util.concurrent.atomic.{AtomicInteger, AtomicReference}

object AtomicCounterDemo {
  def main(args: Array[String]): Unit = {
    val counter = new AtomicInteger(0)
    val unsafeTotal = new AtomicInteger(0)

    val threads = (1 to 4).map { _ =>
      new Thread(() => {
        for (_ <- 1 to 1000) {
          counter.incrementAndGet()
          unsafeTotal.addAndGet(2)
        }
      })
    }
    threads.foreach(_.start())
    threads.foreach(_.join())
    println(counter.get())
    println(unsafeTotal.get())

    println(counter.compareAndSet(4000, 0))
    println(counter.compareAndSet(4000, 1))
    println(counter.updateAndGet(_ + 10))
    println(counter.getAndUpdate(_ * 2))
    println(counter.get())

    val names = new AtomicReference[List[String]](Nil)
    val adders = List("a", "b", "c").map { n =>
      new Thread(() => names.updateAndGet(n :: _))
    }
    adders.foreach(_.start())
    adders.foreach(_.join())
    println(names.get().sorted)
  }
}
