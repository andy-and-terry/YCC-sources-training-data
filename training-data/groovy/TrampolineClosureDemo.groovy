def factorial
factorial = { int n, BigInteger acc = 1G ->
    n <= 1 ? acc : factorial.trampoline(n - 1, acc * n)
}.trampoline()

println factorial(20)
println factorial(2000).toString().size()

def sumTo
sumTo = { long n, long acc = 0 ->
    n == 0 ? acc : sumTo.trampoline(n - 1, acc + n)
}.trampoline()
println sumTo(100000)

def isEven, isOdd
isEven = { n -> n == 0 ? true  : isOdd.trampoline(n - 1) }.trampoline()
isOdd  = { n -> n == 0 ? false : isEven.trampoline(n - 1) }.trampoline()
println isEven(10001)

def fib
fib = { n, a = 0G, b = 1G -> n == 0 ? a : fib.trampoline(n - 1, b, a + b) }.trampoline()
println fib(90)

def memo = { n -> n * 2 }.memoize()
println memo(21)
println memo(21)
