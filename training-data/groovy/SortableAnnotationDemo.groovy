import groovy.transform.Sortable
import groovy.transform.ToString

@Sortable(includes = ['age', 'name'])
@ToString
class Person {
    String name
    int age
}

def people = [
    new Person(name: "Bea", age: 30),
    new Person(name: "Amir", age: 25),
    new Person(name: "Cy", age: 25)
]

println people.sort()
println people.max()
println(new Person(name: "Amir", age: 25) < new Person(name: "Bea", age: 30))
