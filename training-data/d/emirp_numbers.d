import std.algorithm, std.conv, std.range, std.stdio;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) if (n % i == 0) return false;
    return true;
}

int reversed(int n) {
    return n.to!string.retro.to!string.to!int;
}

void main() {
    auto emirps = iota(2, 200).filter!(p => reversed(p) != p && isPrime(p) && isPrime(reversed(p)));
    writeln(emirps); // [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
}
