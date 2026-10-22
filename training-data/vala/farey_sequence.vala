void main() {
    int n = 5;
    int a = 0, b = 1, c = 1, d = n;
    while (true) {
        stdout.printf("%d/%d ", a, b);
        if (a == 1 && b == 1) {
            break;
        }
        int k = (n + b) / d;
        int e = k * c - a;
        int f = k * d - b;
        a = c;
        b = d;
        c = e;
        d = f;
    }
    stdout.printf("\n");
}
