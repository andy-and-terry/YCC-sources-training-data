import std.stdio;
import core.bitop : popcnt;

int popcount(ulong n) {
    int c;
    for (; n; n &= n - 1) c++;
    return c;
}

void main() {
    writeln(popcount(0xB7), " ", popcnt(0xB7));
}
