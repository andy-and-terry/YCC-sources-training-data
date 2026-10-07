def add = { int a, int b -> a + b }
def addFive = add.curry(5)
println addFive(10)

def slowSquare = { int n ->
    Thread.sleep(1)
    return n * n
}
def memoSquare = slowSquare.memoize()
println memoSquare(6)
println memoSquare(6)
println memoSquare(7)
