def people = [[name: 'Ann', age: 30], [name: 'Bob', age: 25]]
println people*.name
println people.collect { it.age }.sum()
println people.find { it.age < 28 }?.name
