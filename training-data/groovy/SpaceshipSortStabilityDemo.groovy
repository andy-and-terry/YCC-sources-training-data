def people = [
    [name: 'Ann', age: 30],
    [name: 'Bob', age: 25],
    [name: 'Cid', age: 30],
    [name: 'Dee', age: 25]
]
println people.sort(false) { a, b -> a.age <=> b.age ?: a.name <=> b.name }*.name
println people.sort(false) { a, b -> b.age <=> a.age }*.name
println people.toSorted { it.name }.reverse()*.name
println people.groupBy { it.age }.collectEntries { k, v -> [k, v*.name] }
println people.min { it.age }.name
println people.countBy { it.age }
