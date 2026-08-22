import std.stdio;

int[] fibonacci(int n) {
    int[] result;
    int a = 0, b = 1;
    for (int i = 0; i < n; i++) {
        result ~= a;
        int temp = a + b;
        a = b;
        b = temp;
    }
    return result;
}

void main() {
    writeln(fibonacci(11));
}
