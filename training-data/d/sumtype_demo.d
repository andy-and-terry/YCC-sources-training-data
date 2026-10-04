import std.stdio;
import std.sumtype;

struct Circle { double r; }
struct Square { double side; }
struct Rect { double w, h; }

alias Shape = SumType!(Circle, Square, Rect);

double area(Shape s) {
    return s.match!(
        (Circle c) => 3.14159265 * c.r * c.r,
        (Square q) => q.side * q.side,
        (Rect r) => r.w * r.h
    );
}

void main() {
    Shape[] shapes = [Shape(Circle(1.0)), Shape(Square(2.0)), Shape(Rect(2.0, 3.5))];
    foreach (s; shapes)
        writefln("area = %.2f", area(s));

    Shape s = Square(3);
    writeln(s.match!((Square q) => "square", _ => "other"));
}
