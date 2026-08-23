import std.stdio;

long factorial(int n) {
    return n <= 1 ? 1 : n * factorial(n - 1);
}

void main() {
    foreach (i; 0 .. 11) {
        writeln(factorial(i));
    }
}
