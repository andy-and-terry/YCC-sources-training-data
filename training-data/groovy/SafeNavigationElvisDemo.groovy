class Person {
    String name
    Person boss
}

def alice = new Person(name: 'Alice')
def bob = new Person(name: 'Bob', boss: alice)

println bob.boss?.name
println alice.boss?.name
println alice.boss?.name ?: 'no boss'

def missing = null
println missing?.length() ?: -1
