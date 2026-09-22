import std.stdio;
import core.thread;

synchronized class Counter {
    private int count;

    void increment() {
        count++;
    }

    int value() {
        return count;
    }
}

void main() {
    shared Counter counter = new shared Counter();

    void worker() {
        foreach (i; 0 .. 1000) {
            counter.increment();
        }
    }

    Thread[] threads;
    foreach (i; 0 .. 4) {
        threads ~= new Thread(&worker);
    }
    foreach (t; threads) t.start();
    foreach (t; threads) t.join();

    writeln(counter.value());
}
