import std.stdio;

mixin template Counted() {
    int count;
    void tick() { ++count; }
}

struct Clicker { mixin Counted; }

void main() {
    Clicker c;
    c.tick(); c.tick();
    writeln(c.count);
}
