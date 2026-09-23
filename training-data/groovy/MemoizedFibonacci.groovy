import groovy.transform.Memoized

class Calculator {
    int calls = 0

    @Memoized
    long fib(int n) {
        calls++
        return n < 2 ? n : fib(n - 1) + fib(n - 2)
    }
}

def calc = new Calculator()
println calc.fib(20)
println calc.calls

calc.fib(20)
println calc.calls
