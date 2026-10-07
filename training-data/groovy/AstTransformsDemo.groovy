import groovy.transform.*

@ToString(includeNames = true)
@EqualsAndHashCode
@TupleConstructor
class Person {
    String first
    String last
}

@Immutable
class Point {
    int x
    int y
}

class Service {
    @Lazy List<String> cache = { println 'loading cache...'; ['a', 'b'] }()

    @Memoized
    int slowSquare(int n) {
        println "computing $n"
        n * n
    }

    @Synchronized
    void touch() { println 'synchronized call' }
}

def people = [new Person('Zed', 'Adams'), new Person('Amy', 'Adams'), new Person('Bo', 'Zed')]
println people.sort { a, b -> a.last <=> b.last ?: a.first <=> b.first }
println new Person('A', 'B') == new Person('A', 'B')

def p = new Point(1, 2)
println p
try { p.x = 5 } catch (ReadOnlyPropertyException e) { println 'immutable!' }

def s = new Service()
println s.slowSquare(4)
println s.slowSquare(4)
println s.cache
println s.cache
s.touch()
