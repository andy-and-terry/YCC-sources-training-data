import groovy.transform.Immutable
import groovy.transform.builder.Builder

@Immutable
@Builder
class Point {
    int x
    int y
}

def p1 = Point.builder().x(3).y(4).build()
println "${p1.x}, ${p1.y}"

try {
    p1.x = 10
} catch (ReadOnlyPropertyException e) {
    println "cannot mutate: ${e.message}"
}

def p2 = new Point(3, 4)
println p1 == p2
