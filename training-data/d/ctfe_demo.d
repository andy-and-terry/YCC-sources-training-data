import std.stdio;

int factorial(int n) {
    return n <= 1 ? 1 : n * factorial(n - 1);
}

int[10] buildFactorialTable() {
    int[10] table;
    foreach (i; 0 .. 10) {
        table[i] = factorial(i);
    }
    return table;
}

enum factorialTable = buildFactorialTable();

void main() {
    writeln(factorialTable);
    writeln(factorial(5));
}
