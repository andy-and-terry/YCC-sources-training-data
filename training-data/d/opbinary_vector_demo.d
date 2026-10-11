import std.stdio;

struct Vec2 {
    double x, y;

    Vec2 opBinary(string op)(Vec2 r) const if (op == "+" || op == "-") {
        return mixin("Vec2(x " ~ op ~ " r.x, y " ~ op ~ " r.y)");
    }

    Vec2 opBinary(string op : "*")(double k) const {
        return Vec2(x * k, y * k);
    }

    Vec2 opUnary(string op : "-")() const {
        return Vec2(-x, -y);
    }
}

void main() {
    auto a = Vec2(1, 2), b = Vec2(3, 5);
    writeln(a + b);
    writeln(b - a);
    writeln(a * 3);
    writeln(-a);
}
