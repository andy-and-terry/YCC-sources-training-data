import std.stdio, std.conv, std.algorithm, std.range;

bool isPrime(long n) {
    if (n < 2) return false;
    for (long i = 2; i * i <= n; i++) if (n % i == 0) return false;
    return true;
}

void main() {
    long[] output;
    for (long n = 2; output.length < 10; n++) {
        long r = n.to!string.retro.to!string.to!long;
        if (r != n && isPrime(n) && isPrime(r)) output ~= n;
    }
    writeln(output.map!(to!string).joiner(" ")); // 13 17 31 37 71 73 79 97 107 113
}
