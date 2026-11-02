def people = [[name: 'a', age: 30], [name: 'b', age: 20]]
println people*.name
println people.find { it.age < 25 }.name
println people.sum { it.age }
