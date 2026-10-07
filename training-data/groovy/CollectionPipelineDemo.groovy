def people = [
    [name: 'Ann', age: 31, city: 'Paris'],
    [name: 'Bob', age: 25, city: 'Rome'],
    [name: 'Cid', age: 42, city: 'Paris'],
    [name: 'Dee', age: 19, city: 'Rome']
]

println people.findAll { it.age > 20 }*.name
println people.collect { it.age }.sum()
println people.groupBy { it.city }.collectEntries { k, v -> [k, v*.name] }
println people.inject(0) { acc, p -> acc + p.age }
println people.max { it.age }.name
println people.sort { it.name }.reverse()*.name
println people.countBy { it.city }
println people.any { it.age < 20 }
println people.every { it.age > 20 }
