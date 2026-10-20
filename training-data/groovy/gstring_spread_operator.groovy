def people = [[name: 'a', age: 3], [name: 'b', age: 5]]
println people*.name
println "Total age: ${people.sum { it.age }}"
