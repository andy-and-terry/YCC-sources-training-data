import std.stdio;

long power(int base, int exp) {
    long result = 1;
    foreach (i; 0 .. exp) result *= base;
    return result;
}

void main() {
    writeln(power(2, 10));
    writeln(power(3, 5));
}
