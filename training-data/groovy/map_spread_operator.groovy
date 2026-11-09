def people = [[name: 'Ann', age: 31], [name: 'Bob', age: 25]]
println people*.name
println people.sum { it.age }
println people.max { it.age }.name
