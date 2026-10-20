trait Walker { String walk() { "$name walks" } abstract String getName() }
trait Swimmer { String swim() { "swims" } }
class Duck implements Walker, Swimmer { String name }
def d = new Duck(name: 'Donald')
println d.walk() + ' ' + d.swim()

class Person {
    String name
    int age
    private String secret = 'x'
    String toString() { "$name ($age)" }
    boolean equals(o) { o instanceof Person && o.name == name && o.age == age }
    int hashCode() { name.hashCode() * 31 + age }
    def propertyMissing(String n) { "no $n" }
    def methodMissing(String n, args) { "called $n with ${args.size()}" }
}
def p = new Person(name: 'Ada', age: 36)
println p
println p.age++ + ' ' + p.age
println p == new Person(name: 'Ada', age: 37)
println p.unknownProp + ' ' + p.unknownMethod(1, 2)
println p.properties.keySet().sort() - ['class']
p.with { name = 'Bob'; age = 50 }
println p
@groovy.transform.ToString(includeNames = true) class Pt { int x, y }
println new Pt(x: 1, y: 2)
@groovy.transform.Immutable class Money { BigDecimal amt; String cur }
println new Money(amt: 5.5, cur: 'USD')
