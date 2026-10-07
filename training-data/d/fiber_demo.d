import std.stdio;
import core.thread : Fiber;

void main() {
    int shared_ = 0;
    auto fib = new Fiber({
        foreach (i; 1 .. 4) {
            shared_ = i * 10;
            writeln("fiber step ", i);
            Fiber.yield();
        }
    });

    while (fib.state != Fiber.State.TERM) {
        fib.call();
        writeln("main sees ", shared_);
    }
}
