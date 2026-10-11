import std.stdio;
import std.range.primitives;

struct Countdown {
    int n;
    bool empty() const { return n <= 0; }
    int front() const { return n; }
    void popFront() { --n; }
}

static assert(isInputRange!Countdown);

void main() {
    foreach (x; Countdown(5)) write(x, " ");
    writeln();
}
