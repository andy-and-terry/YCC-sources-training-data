import std.stdio;

int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

void main() {
    writeln(gcd(48, 18));
    writeln(gcd(100, 75));
}
