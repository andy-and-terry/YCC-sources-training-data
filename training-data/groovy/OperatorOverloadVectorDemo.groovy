class Vec {
    double x, y
    Vec(double x, double y) { this.x = x; this.y = y }
    Vec plus(Vec o) { new Vec(x + o.x, y + o.y) }
    Vec minus(Vec o) { new Vec(x - o.x, y - o.y) }
    Vec multiply(double k) { new Vec(x * k, y * k) }
    Vec negative() { new Vec(-x, -y) }
    boolean equals(o) { o instanceof Vec && o.x == x && o.y == y }
    int hashCode() { Objects.hash(x, y) }
    double getAt(int i) { i == 0 ? x : y }
    String toString() { "($x, $y)" }
}

def a = new Vec(1, 2)
def b = new Vec(3, 4)
println a + b
println b - a
println a * 3
println(-a)
println a == new Vec(1, 2)
println b[1]
