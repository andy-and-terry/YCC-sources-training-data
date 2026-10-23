import std.stdio;
import std.algorithm;
import std.array;
import std.conv;
import std.range;

long digitSum(long n) {
    long s = 0;
    for (; n > 0; n /= 10)
        s += n % 10;
    return s;
}

long[] primeFactors(long n) {
    long[] fs;
    for (long p = 2; n > 1; p++) {
        if (p * p > n) {
            fs ~= n;
            break;
        }
        while (n % p == 0) {
            fs ~= p;
            n /= p;
        }
    }
    return fs;
}

bool isSmith(long n) {
    auto fs = primeFactors(n);
    return fs.length > 1 && digitSum(n) == fs.map!(f => digitSum(f)).sum;
}

void main() {
    writeln(iota(2, 100).filter!(n => isSmith(n)).map!(n => n.to!string).join(" "));
}
