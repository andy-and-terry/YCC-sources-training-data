import std.stdio;

// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
bool isMunchausen(int n) {
    int sum = 0;
    for (int m = n; m > 0; m /= 10) {
        int d = m % 10, p = d ? 1 : 0;
        foreach (_; 0 .. d) p *= d;
        sum += p;
    }
    return sum == n;
}

void main() {
    foreach (n; 1 .. 5000)
        if (isMunchausen(n)) write(n, " ");
    writeln();
}
