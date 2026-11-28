import std.stdio;

int digitSquareSum(int n) {
    int s = 0;
    for (; n > 0; n /= 10) s += (n % 10) * (n % 10);
    return s;
}

bool isHappy(int n) {
    bool[int] seen;
    while (n != 1 && n !in seen) {
        seen[n] = true;
        n = digitSquareSum(n);
    }
    return n == 1;
}

void main() {
    for (int n = 1, c = 0; c < 8; n++) {
        if (isHappy(n)) { write(n, " "); c++; }
    }
    writeln(); // 1 7 10 13 19 23 28 31
}
