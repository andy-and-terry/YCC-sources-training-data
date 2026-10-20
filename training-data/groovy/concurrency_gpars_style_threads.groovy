import java.util.concurrent.*
def pool = Executors.newFixedThreadPool(3)
def futures = (1..5).collect { n -> pool.submit({ n * n } as Callable) }
println futures*.get()
pool.shutdown()
println pool.awaitTermination(1, TimeUnit.SECONDS)
def results = Collections.synchronizedList([])
def threads = (1..4).collect { n -> Thread.start { results << n * 10 } }
threads*.join()
println results.sort()
def counter = new java.util.concurrent.atomic.AtomicInteger()
(1..100).collect { Thread.start { counter.incrementAndGet() } }*.join()
println counter.get()
def latch = new CountDownLatch(2)
2.times { Thread.start { latch.countDown() } }
latch.await()
println latch.count
def cf = CompletableFuture.supplyAsync { 6 * 7 }.thenApply { it + 1 }
println cf.get()
def q = new LinkedBlockingQueue()
Thread.start { 3.times { q.put(it) }; q.put('end') }
def got = []
while ((def v = q.take()) != 'end') got << v
println got
@groovy.transform.Synchronized def safe() { 'sync' }
println safe()
