import std.stdio;
import std.algorithm : sort, equal;
import std.conv : to;
import std.array : array;

// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
bool isBouncy(int n) {
    auto d = n.to!string.dup;
    auto up = d.dup;
    up.sort();
    auto down = up.dup;
    down.reverse();
    return d != up && d != down;
}

void main() {
    int count = 0;
    foreach (n; 1 .. 1000)
        if (isBouncy(n)) count++;
    writeln(count);
}
