import std.stdio;

struct Fibonacci {
    private int a = 0;
    private int b = 1;
    private int remaining;

    this(int count) { remaining = count; }

    bool empty() const { return remaining == 0; }

    int front() const { return a; }

    void popFront() {
        auto next = a + b;
        a = b;
        b = next;
        remaining--;
    }
}

void main() {
    auto fib = Fibonacci(10);
    foreach (n; fib) {
        write(n, " ");
    }
    writeln();
}
