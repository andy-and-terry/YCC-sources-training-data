import std.stdio;
import std.sumtype;
import std.math : PI;

struct Circle { double radius; }
struct Rect { double w, h; }
struct Triangle { double base, height; }

alias Shape = SumType!(Circle, Rect, Triangle);

double area(Shape s) {
    return s.match!(
        (Circle c) => PI * c.radius * c.radius,
        (Rect r) => r.w * r.h,
        (Triangle t) => 0.5 * t.base * t.height
    );
}

string name(Shape s) {
    return s.match!(
        (Circle _) => "circle",
        (Rect _) => "rect",
        (Triangle _) => "triangle"
    );
}

void main() {
    Shape[] shapes = [Shape(Circle(1.0)), Shape(Rect(2, 3)), Shape(Triangle(4, 5))];
    foreach (s; shapes)
        writefln("%s: %.2f", name(s), area(s));
}
