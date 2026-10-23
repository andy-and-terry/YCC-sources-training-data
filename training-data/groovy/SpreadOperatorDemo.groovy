def people = [[name: 'Ann', age: 31], [name: 'Ben', age: 25]]

println people*.name
println people*.age.sum()

def add(a, b, c) { a + b + c }
def args = [1, 2, 3]
println add(*args)

def merged = [*[1, 2], *[3, 4]]
println merged

def m = [a: 1, *: [b: 2, c: 3]]
println m
