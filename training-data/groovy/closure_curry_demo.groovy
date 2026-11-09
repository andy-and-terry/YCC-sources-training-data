def add = { a, b -> a + b }
def add5 = add.curry(5)
println add5(3)
def compose = { f, g -> { x -> f(g(x)) } }
println compose({ it * 2 }, { it + 1 })(4)
