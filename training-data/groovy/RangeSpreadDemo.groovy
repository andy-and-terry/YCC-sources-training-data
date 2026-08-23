def squares = (1..10).collect { it * it }
def evens = (1..20).findAll { it % 2 == 0 }
def total = (1..100).sum()

println squares
println evens
println total
