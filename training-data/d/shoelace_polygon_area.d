import std.stdio, std.math;
// Shoelace polygon area with a struct.
struct Point { double x, y; }
double area(Point[] p) {
    double s = 0;
    foreach (i, a; p) { auto b = p[(i + 1) % p.length]; s += a.x * b.y - b.x * a.y; }
    return abs(s) / 2;
}
void main() { writeln(area([Point(0, 0), Point(4, 0), Point(4, 3), Point(0, 3)])); }
