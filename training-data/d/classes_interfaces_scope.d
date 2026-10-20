import std.stdio;

interface Shape {
    double area() const;
    string name() const;
}

abstract class Base : Shape {
    string name() const { return typeid(this).name; }
}

class Circle : Base {
    double r;
    this(double r) { this.r = r; }
    override double area() const { return 3.14159 * r * r; }
}

class Rect : Base {
    double w, h;
    this(double w, double h) { this.w = w; this.h = h; }
    override double area() const { return w * h; }
    override string name() const { return "rect"; }
}

struct Guard {
    string label;
    ~this() { writeln("destroy ", label); }
}

void main() {
    Shape[] shapes = [new Circle(1), new Rect(2, 3)];
    foreach (s; shapes) writefln("%s %.2f", s.name, s.area);
    if (auto c = cast(Circle) shapes[0]) writeln("circle r=", c.r);
    writeln(cast(Rect) shapes[0] is null);
    {
        auto g = Guard("inner");
        scope(exit) writeln("scope exit");
        scope(success) writeln("scope success");
        writeln("in block");
    }
    try {
        scope(failure) writeln("scope failure");
        throw new Exception("boom");
    } catch (Exception e) { writeln("caught ", e.msg); }
}
