import std.stdio, std.math, std.conv, std.algorithm;

int digitSquareSum(int n) {
    return abs(n).to!string.map!(c => (c - '0') * (c - '0')).sum;
}

void main() {
    writeln(digitSquareSum(123));
    writeln(digitSquareSum(-99));
}
