import std.stdio;
import std.algorithm;
import std.array;
import std.conv;
import std.range;

long woodall(int n) {
    return n * (1L << n) - 1;
}

void main() {
    writeln(iota(1, 11).map!(n => woodall(n).to!string).join(" "));
}
