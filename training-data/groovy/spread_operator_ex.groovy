def people = [[name: 'a', age: 1], [name: 'b', age: 2]]
println people*.name
println people.collect { it.age }.sum()
def f(x, y, z) { x + y + z }
println f(*[1, 2, 3])
println([1, 2] + [*[3, 4], 5])
