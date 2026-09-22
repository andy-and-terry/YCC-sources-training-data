delegate int Operation(int a, int b);

int apply(Operation op, int a, int b) {
    return op(a, b);
}

int add(int a, int b) {
    return a + b;
}

void main() {
    Operation multiply = (a, b) => a * b;

    stdout.printf("%d\n", apply(add, 3, 4));
    stdout.printf("%d\n", apply(multiply, 3, 4));

    int factor = 10;
    Operation scaleAndAdd = (a, b) => (a + b) * factor;
    stdout.printf("%d\n", apply(scaleAndAdd, 1, 2));
}
