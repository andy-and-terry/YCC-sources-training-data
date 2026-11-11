// Population count (number of set bits) for 0..15
import std.stdio;
import core.bitop : popcnt;

void main() {
    foreach (n; 0 .. 16) write(popcnt(n), " ");
    writeln();
}
