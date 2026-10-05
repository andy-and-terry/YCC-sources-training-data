class Person {
    String name
    Person boss
    List<String> skills = []
}

def boss = new Person(name: 'Zed')
def ann = new Person(name: 'Ann', boss: boss, skills: ['sql', 'groovy'])
def bob = new Person(name: 'Bob')

def people = [ann, bob, boss]
println people*.name
println people*.skills*.size()
println people.collect { it.boss?.name ?: 'nobody' }
println people.skills.flatten()

def args = [1, 2, 3]
def sum3 = { a, b, c -> a + b + c }
println sum3(*args)
println [*args, 4, *[5, 6]]
println([a: 1, *: [b: 2, c: 3]])

def name = null
println name ?: 'default'
name ?= 'assigned'
println name
println bob?.boss?.boss?.name
