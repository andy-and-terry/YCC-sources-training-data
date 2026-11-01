trait Greeter {
    String name
    String greet() { "Hi, ${name}" }
}
class Person implements Greeter {}
def p = new Person(name: 'Ann')
println p.greet()
