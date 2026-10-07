import java.util.concurrent.CountDownLatch
import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.Executors

def counter = new AtomicInteger()
def latch = new CountDownLatch(4)

4.times { id ->
    Thread.start {
        1000.times { counter.incrementAndGet() }
        latch.countDown()
    }
}
latch.await()
println counter.get()

def pool = Executors.newFixedThreadPool(3)
def futures = (1..5).collect { n -> pool.submit({ n * n } as java.util.concurrent.Callable) }
println futures*.get()
pool.shutdown()

def lock = new Object()
int shared = 0
def ts = (1..3).collect { Thread.start { 500.times { synchronized (lock) { shared++ } } } }
ts*.join()
println shared
