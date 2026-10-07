import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicInteger

def pool = Executors.newFixedThreadPool(4)
def counter = new AtomicInteger()

def futures = (1..5).collect { n ->
    pool.submit({
        counter.addAndGet(n)
        n * n
    } as java.util.concurrent.Callable)
}
println futures*.get()
println "Counter: ${counter.get()}"

def results = Collections.synchronizedList([])
def threads = (1..3).collect { id ->
    Thread.start("worker-$id") {
        results << "${Thread.currentThread().name} done"
    }
}
threads*.join()
println results.sort()

pool.shutdown()
println pool.awaitTermination(1, TimeUnit.SECONDS)

def lock = new Object()
def total = 0
(1..4).collect { Thread.start { 100.times { synchronized (lock) { total++ } } } }*.join()
println total
