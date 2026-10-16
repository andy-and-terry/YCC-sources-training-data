def time(String label, Closure body) {
    def start = System.nanoTime()
    def result = body()
    def ms = (System.nanoTime() - start) / 1_000_000
    println "$label: result=$result (took ${ms >= 0 ? 'some' : 'neg'} ms)"
    result
}

time('sum') { (1..100000).sum() }
time('string') { (1..1000).collect { "n$it" }.join().size() }
time('fib') {
    def fib
    fib = { n -> n < 2 ? n : fib(n - 1) + fib(n - 2) }
    fib(15)
}
time('sort') { (1..1000).reverse().sort().first() }
