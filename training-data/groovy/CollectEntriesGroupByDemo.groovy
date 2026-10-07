def people = [
    [name: 'Ann', age: 31, dept: 'Eng'],
    [name: 'Bob', age: 25, dept: 'Ops'],
    [name: 'Cy',  age: 42, dept: 'Eng'],
    [name: 'Di',  age: 29, dept: 'Ops'],
    [name: 'Ed',  age: 35, dept: 'HR']
]

def byDept = people.groupBy { it.dept }
byDept.each { dept, members -> println "$dept: ${members*.name}" }

println people.collectEntries { [(it.name): it.age] }
println people.countBy { it.age >= 30 ? 'senior' : 'junior' }
println people.findAll { it.age > 28 }.collect { it.name }
println people.find { it.dept == 'HR' }?.name
println people.sum { it.age } / people.size()
println people.max { it.age }.name
println people.collectMany { [it.name, it.dept] }.unique()
println people.split { it.dept == 'Eng' }*.size()
println byDept.collectEntries { k, v -> [k, v.size()] }
