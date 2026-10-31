import std.stdio;

int alternatingDigitSum(int n) {
    int total = 0, sign = 1;
    for (; n > 0; n /= 10, sign = -sign) total += sign * (n % 10);
    return total;
}

void main() {
    foreach (n; [1234, 99999, 1000])
        writeln(n, " ", alternatingDigitSum(n));
}
