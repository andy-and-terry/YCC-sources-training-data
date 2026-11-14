import groovy.transform.*

@ToString(includeNames = true)
@EqualsAndHashCode
class P { String name; int age }

def a = new P(name: 'Ann', age: 30)
println a
println a == new P(name: 'Ann', age: 30)
