import std.stdio;

int delegate() makeCounter(int start) {
    int n = start;
    return () => n++;
}

void main() {
    int total;
    void add(int x) { total += x; }
    add(3);
    add(4);
    writeln(total);

    auto c = makeCounter(10);
    writeln(c(), " ", c(), " ", c());
}
