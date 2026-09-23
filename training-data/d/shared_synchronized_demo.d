import std.stdio;
import std.concurrency;

synchronized class Counter {
    private int count;

    void increment() {
        count++;
    }

    int value() {
        return count;
    }
}

shared Counter counter;

void worker(int times, Tid owner) {
    foreach (_; 0 .. times) {
        counter.increment();
    }
    send(owner, true);
}

void main() {
    counter = new shared(Counter)();

    spawn(&worker, 1000, thisTid);
    spawn(&worker, 1000, thisTid);

    receiveOnly!bool();
    receiveOnly!bool();

    writeln(counter.value());
}
