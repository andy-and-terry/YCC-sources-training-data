import std.stdio, std.parallelism, std.range, std.concurrency, core.thread, core.atomic;

void worker(Tid parent, int n) {
    send(parent, n * n);
}

void main() {
    auto squares = new int[8];
    foreach (i, ref x; parallel(squares)) x = cast(int)(i * i);
    writeln(squares);
    writeln(taskPool.reduce!"a + b"(iota(1, 101)));
    auto t = task!((int n) { int s = 0; foreach (i; 1 .. n + 1) s += i; return s; })(100);
    t.executeInNewThread();
    writeln(t.yieldForce);
    foreach (i; 1 .. 4) spawn(&worker, thisTid, i);
    int total;
    foreach (_; 0 .. 3) total += receiveOnly!int;
    writeln(total);
    shared int counter;
    Thread[] ts;
    foreach (_; 0 .. 4) {
        ts ~= new Thread({ foreach (__; 0 .. 1000) atomicOp!"+="(counter, 1); });
        ts[$ - 1].start();
    }
    foreach (th; ts) th.join();
    writeln(counter);
}
