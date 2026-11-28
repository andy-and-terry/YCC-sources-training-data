import std.stdio;

interface Shape { double area(); }
class Sq : Shape { double s; this(double s) { this.s = s; } double area() { return s * s; } }
class Circ : Shape { double r; this(double r) { this.r = r; } double area() { return 3.14159 * r * r; } }

void main() {
    Shape[] ss = [new Sq(2), new Circ(1)];
    foreach (s; ss) writefln("%.2f", s.area());
}
