import groovy.transform.Memoized

class SlowMath {
    int calls = 0

    @Memoized
    long fib(int n) {
        calls++
        n < 2 ? n : fib(n - 1) + fib(n - 2)
    }
}

def math = new SlowMath()
println "fib(20) = ${math.fib(20)}"
println "calls made: ${math.calls}"
// calling again with the same argument hits the memoized cache, so
// calls stays the same instead of re-running the recursion.
println "fib(20) again = ${math.fib(20)}"
println "calls made after cached call: ${math.calls}"
