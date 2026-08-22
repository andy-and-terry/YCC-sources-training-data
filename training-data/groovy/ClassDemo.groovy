class Point {
    double x
    double y

    Point plus(Point other) {
        new Point(x: x + other.x, y: y + other.y)
    }

    String toString() {
        "(${x}, ${y})"
    }
}

def p1 = new Point(x: 1, y: 2)
def p2 = new Point(x: 3, y: 4)
println p1 + p2
