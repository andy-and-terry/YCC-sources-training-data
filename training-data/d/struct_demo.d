import std.stdio;

struct Point {
    double x;
    double y;

    Point opBinary(string op)(Point other) if (op == "+") {
        return Point(x + other.x, y + other.y);
    }
}

void main() {
    auto p1 = Point(1.0, 2.0);
    auto p2 = Point(3.0, 4.0);
    auto p3 = p1 + p2;
    writeln(p3);
}
