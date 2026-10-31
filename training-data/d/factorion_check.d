import std.stdio;

immutable int[10] fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];

bool isFactorion(int n) {
    int sum = 0;
    for (int m = n; m > 0; m /= 10) sum += fact[m % 10];
    return sum == n;
}

void main() {
    foreach (n; 1 .. 50_000)
        if (isFactorion(n)) write(n, " ");
    writeln();
}
