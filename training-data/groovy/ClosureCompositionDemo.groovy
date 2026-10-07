def inc = { it + 1 }
def dbl = { it * 2 }
def sq  = { it * it }

println((inc >> dbl)(3))
println((inc << dbl)(3))
println((inc >> dbl >> sq)(1))

def pipeline = [inc, dbl, sq].inject { a, b -> a >> b }
println pipeline(2)

def memo = { n -> n * 1000 }.memoize()
println memo(5)
println memo(5)

def addThree = { a, b, c -> a + b + c }
println addThree.curry(1).curry(2)(3)
println addThree.rcurry(30)(10, 20)
