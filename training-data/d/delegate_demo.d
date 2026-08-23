import std.stdio;

int applyOp(int delegate(int, int) op, int a, int b) {
    return op(a, b);
}

void main() {
    auto add = (int a, int b) => a + b;
    auto sub = (int a, int b) => a - b;
    writeln(applyOp(add, 3, 4));
    writeln(applyOp(sub, 10, 3));
}
