def add = { a, b -> a + b }
def inc = add.curry(1)
def dbl = { it * 2 }
println inc(5)
println (inc >> dbl)(5)
println (inc << dbl)(5)
