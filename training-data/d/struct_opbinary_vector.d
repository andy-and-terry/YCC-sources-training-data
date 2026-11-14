import std.stdio;

struct V {
    double x, y;
    V opBinary(string op)(V o) if (op == "+" || op == "-") {
        return V(mixin("x " ~ op ~ " o.x"), mixin("y " ~ op ~ " o.y"));
    }
}

void main() { writeln(V(1, 2) + V(3, 4)); writeln(V(5, 5) - V(1, 2)); }
