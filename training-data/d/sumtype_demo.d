import std.stdio;
import std.sumtype;

struct Circle { double r; }
struct Rect { double w, h; }
alias Shape = SumType!(Circle, Rect);

double area(Shape s) {
    return s.match!(
        (Circle c) => 3.14159 * c.r * c.r,
        (Rect r) => r.w * r.h
    );
}

void main() {
    Shape a = Circle(2.0);
    Shape b = Rect(3.0, 4.0);
    writeln(area(a));
    writeln(area(b));
    writeln(b.match!((Circle _) => "circle", (Rect _) => "rect"));
}
