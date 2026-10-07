import std.stdio;

struct Point {
    int x;
    int y;

    int sum() const {
        return x + y;
    }
}

int total(const int[] values) {
    int sum = 0;
    foreach (v; values) sum += v;
    return sum;
}

void printPoint(const(Point)* p) {
    writeln("(", p.x, ", ", p.y, ")");
}

void main() {
    const int[] data = [1, 2, 3, 4, 5];
    writeln(total(data));

    const p = Point(3, 4);
    writeln(p.sum());
    printPoint(&p);

    // head-const: the slice binding is mutable, the chars behind it are not
    const(char)[] label = "immutable-ish".dup;
    writeln(label);
}
