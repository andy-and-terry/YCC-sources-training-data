class Vector2 {
    double x, y

    Vector2 plus(Vector2 other) {
        return new Vector2(x: x + other.x, y: y + other.y)
    }

    Vector2 multiply(double scalar) {
        return new Vector2(x: x * scalar, y: y * scalar)
    }

    boolean equals(Object other) {
        return other instanceof Vector2 && x == other.x && y == other.y
    }

    String toString() {
        return "(${x}, ${y})"
    }
}

def a = new Vector2(x: 1, y: 2)
def b = new Vector2(x: 3, y: 4)

println a + b
println a * 3
println(a + b == new Vector2(x: 4, y: 6))
