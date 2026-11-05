import std.stdio;

int twice(int x) { return x * 2; }
int addN(int x, int n) { return x + n; }

void main() {
    writeln(5.twice.addN(3));
}
