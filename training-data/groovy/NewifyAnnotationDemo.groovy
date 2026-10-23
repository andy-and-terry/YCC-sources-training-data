import groovy.transform.Newify
import groovy.transform.TupleConstructor

// @Newify lets you create instances without the `new` keyword, or with a
// Ruby-style `Type.new(...)` call.
@TupleConstructor
class Point {
    int x, y
    String toString() { "($x, $y)" }
}

@TupleConstructor
class Line {
    Point from, to
    double length() { Math.sqrt((to.x - from.x)**2 + (to.y - from.y)**2) }
}

@Newify([Point, Line])
def makeLine() {
    Line(Point(0, 0), Point(3, 4))
}

@Newify
def makeRubyStyle() {
    Point.new(5, 6)
}

def line = makeLine()
println "from ${line.from} to ${line.to}"
println line.length()
println makeRubyStyle()

// Useful for building trees concisely
@Newify([Point])
def points() {
    [Point(1, 1), Point(2, 4), Point(3, 9)]
}
println points()
println points()*.y.sum()
