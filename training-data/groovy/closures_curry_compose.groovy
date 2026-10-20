def add = { a, b -> a + b }
def inc = add.curry(1)
def dbl = { it * 2 }
println((inc >> dbl)(4))
println([1, 2, 3].collect { dbl(it) })
