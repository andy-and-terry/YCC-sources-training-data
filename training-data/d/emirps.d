// Emirps below 200; expect 15.
import std.stdio;
import std.conv : to;
import std.range : iota;
import std.algorithm : filter, reverse;
import std.array : array;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

int rev(int n) {
    char[] s = n.to!string.dup;
    s.reverse();
    return s.to!int;
}

void main() {
    auto found = iota(2, 200).filter!(n => rev(n) != n && isPrime(n) && isPrime(rev(n))).array;
    writeln(found.length, " ", found);
}
