trait Greeter {
    String name
    String greet() { "Hello, ${name}" }
}
class Person implements Greeter {}
def p = new Person(name: 'Ann')
println p.greet()
