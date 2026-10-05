import java.util.concurrent.Callable
import java.util.concurrent.Executors
import java.util.concurrent.atomic.AtomicInteger

def pool = Executors.newFixedThreadPool(4)
def counter = new AtomicInteger()

def futures = (1..5).collect { n ->
    pool.submit({ counter.addAndGet(n); n * n } as Callable)
}
println futures*.get()
println counter.get()

def threads = (1..3).collect { id ->
    Thread.start { counter.incrementAndGet() }
}
threads*.join()
println counter.get()

def lock = new Object()
def shared = []
(1..3).collect { i -> Thread.start { synchronized (lock) { shared << i } } }*.join()
println shared.sort()

pool.shutdown()
