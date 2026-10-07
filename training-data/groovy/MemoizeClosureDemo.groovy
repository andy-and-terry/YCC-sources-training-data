def calls = 0

def slowSquare = { int n ->
    calls++
    n * n
}.memoize()

println slowSquare(4)
println slowSquare(4)
println slowSquare(5)
println "underlying calls: $calls"

def fib
fib = { long n -> n < 2 ? n : fib(n - 1) + fib(n - 2) }.memoize()
println fib(60)

def limited = { String s -> s.reverse() }.memoizeAtMost(2)
println limited('abc')
println limited('xyz')

def bounded = { x -> x + 1 }.memoizeBetween(1, 10)
println bounded(1)

// trampoline avoids stack overflow in deep recursion
def sumTo
sumTo = { int n, long acc ->
    n == 0 ? acc : sumTo.trampoline(n - 1, acc + n)
}.trampoline()
println sumTo(100000, 0L)
