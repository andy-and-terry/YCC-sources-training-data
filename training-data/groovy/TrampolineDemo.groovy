def factorial
factorial = { int n, BigInteger acc = 1 ->
    n <= 1 ? acc : factorial.trampoline(n - 1, acc * n)
}.trampoline()

println factorial(20)
println factorial(2000).toString().size()

def sumTo
sumTo = { long n, long acc = 0 ->
    n == 0 ? acc : sumTo.trampoline(n - 1, acc + n)
}.trampoline()
println sumTo(100000)
