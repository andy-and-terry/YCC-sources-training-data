def people = [
    [name: 'Ann', age: 31, dept: 'eng'],
    [name: 'Bob', age: 24, dept: 'ops'],
    [name: 'Cyd', age: 45, dept: 'eng'],
    [name: 'Dee', age: 29, dept: 'ops'],
    [name: 'Eli', age: 38, dept: 'hr']
]

println people.findAll { it.age > 28 }*.name
println people.collect { it.name.toUpperCase() }
println people.find { it.dept == 'ops' }.name
println people.every { it.age > 20 }
println people.any { it.dept == 'hr' }
println people.sum { it.age }
println people.max { it.age }.name
println people.groupBy { it.dept }.collectEntries { dept, list -> [dept, list*.name] }
println people.countBy { it.dept }
println people.inject(0) { acc, p -> acc + p.age } / people.size()
println people.collect { it.age }.sort(false).reverse().take(3)
println people.split { it.age < 30 }.collect { group -> group*.name }
println people.collectEntries { [(it.name): it.age] }.findAll { k, v -> v % 2 == 1 }
