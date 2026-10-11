import std.stdio;

void divmod(int a, int b, out int q, out int r) {
    q = a / b;
    r = a % b;
}

void main() {
    int q, r;
    divmod(47, 5, q, r);
    writeln(q, " ", r);
}
