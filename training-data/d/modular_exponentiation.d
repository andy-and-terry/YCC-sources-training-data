import std.stdio;

long modPow(long base, long exponent, long modulus) {
    long result = 1;
    base %= modulus;
    while (exponent > 0) {
        if (exponent & 1) result = result * base % modulus;
        exponent >>= 1;
        base = base * base % modulus;
    }
    return result;
}

void main() {
    writeln(modPow(2, 10, 1000));
    writeln(modPow(7, 128, 13));
}
