import groovy.transform.*

@ToString(includeNames = true)
@EqualsAndHashCode
@TupleConstructor
class Point { int x, y }

def p = new Point(1, 2)
println p
println p == new Point(1, 2)
