import std.stdio;

int gcd(int a, int b) {
    while (b != 0) {
        int t = b;
        b = a % b;
        a = t;
    }
    return a;
}

int lcm(int a, int b) {
    return a / gcd(a, b) * b;
}

void main() {
    writeln(lcm(4, 6));
    writeln(lcm(21, 6));
}
