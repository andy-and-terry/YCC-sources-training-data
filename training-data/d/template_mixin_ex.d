import std.stdio;

mixin template Counter() {
    int count;
    void bump() { ++count; }
}

struct A { mixin Counter; }

void main() {
    A a;
    a.bump(); a.bump();
    writeln(a.count);
}
