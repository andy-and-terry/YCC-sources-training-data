import std.stdio;

bool isPowerOfTwo(int n) {
    return n > 0 && (n & (n - 1)) == 0;
}

void main() {
    foreach (n; [1, 2, 3, 4, 16, 18]) {
        writeln(n, ": ", isPowerOfTwo(n));
    }
}
