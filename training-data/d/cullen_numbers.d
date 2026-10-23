import std.stdio;
import std.algorithm;
import std.array;
import std.conv;
import std.range;

long cullen(int n) {
    return n * (1L << n) + 1;
}

void main() {
    writeln(iota(0, 10).map!(n => cullen(n).to!string).join(" "));
}
