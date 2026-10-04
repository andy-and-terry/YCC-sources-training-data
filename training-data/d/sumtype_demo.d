import std.stdio;
import std.sumtype;

struct Circle { double r; }
struct Rect { double w, h; }

alias Shape = SumType!(Circle, Rect);

double area(Shape s)
{
    return s.match!(
        (Circle c) => 3.14159 * c.r * c.r,
        (Rect r) => r.w * r.h
    );
}

void main()
{
    Shape[] shapes = [Shape(Circle(1.0)), Shape(Rect(2, 3))];
    foreach (s; shapes)
        writefln("area = %.2f", area(s));
}
