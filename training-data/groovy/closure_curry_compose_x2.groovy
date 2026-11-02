def add = { a, b -> a + b }
def add5 = add.curry(5)
def twice = { it * 2 }
println((add5 >> twice)(3))
