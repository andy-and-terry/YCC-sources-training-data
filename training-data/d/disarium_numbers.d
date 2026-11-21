import std.stdio;
import std.conv : to;

// Disarium numbers: digits raised to their 1-based positions sum to n.
bool isDisarium(int n) {
    string s = n.to!string;
    int sum = 0;
    foreach (i, c; s) {
        int p = 1;
        foreach (_; 0 .. i + 1) p *= c - '0';
        sum += p;
    }
    return sum == n;
}

void main() {
    foreach (n; 1 .. 1000)
        if (isDisarium(n)) write(n, " ");
    writeln();
}
