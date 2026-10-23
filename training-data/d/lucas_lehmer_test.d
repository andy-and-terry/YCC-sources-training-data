import std.stdio;
import std.algorithm;
import std.array;
import std.conv;

bool lucasLehmer(int p) {
    if (p == 2) return true;
    immutable long m = (1L << p) - 1;
    long s = 4;
    foreach (i; 0 .. p - 2)
        s = (s * s - 2) % m;
    return s == 0;
}

void main() {
    writeln([2, 3, 5, 7, 11, 13, 17, 19].filter!(p => lucasLehmer(p)).map!(p => p.to!string).join(" "));
}
