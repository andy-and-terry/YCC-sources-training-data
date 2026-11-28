import std.algorithm, std.conv, std.range, std.stdio;

bool isAutomorphic(long n) {
    return (n * n).to!string.endsWith(n.to!string);
}

void main() {
    writeln(iota(0, 1000).filter!(n => isAutomorphic(n))); // [0, 1, 5, 6, 25, 76, 376, 625]
}
