import std.algorithm, std.conv, std.math, std.range, std.stdio;

bool isArmstrong(int n) {
    auto digits = n.to!string.map!(c => c - '0').array;
    return digits.map!(d => cast(int) pow(d, digits.length)).sum == n;
}

void main() {
    writeln(iota(1, 1000).filter!isArmstrong); // [1, ..., 9, 153, 370, 371, 407]
}
