import std.stdio;
import std.concurrency;

void worker(Tid owner) {
    receive(
        (int n) {
            int total = 0;
            foreach (i; 1 .. n + 1) total += i;
            send(owner, total);
        }
    );
}

void main() {
    auto tid = spawn(&worker, thisTid);
    send(tid, 100);
    auto result = receiveOnly!int();
    writeln(result);
}
