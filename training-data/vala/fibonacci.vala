int[] fibonacci(int n) {
    int[] result = {};
    int a = 0;
    int b = 1;
    for (int i = 0; i < n; i++) {
        result += a;
        int temp = a + b;
        a = b;
        b = temp;
    }
    return result;
}

void main() {
    foreach (int x in fibonacci(11)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
