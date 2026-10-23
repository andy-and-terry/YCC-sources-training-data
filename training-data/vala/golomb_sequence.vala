void main() {
    int count = 20;
    int[] a = new int[count + 1];
    a[1] = 1;
    for (int n = 2; n <= count; n++) {
        a[n] = 1 + a[n - a[a[n - 1]]];
    }
    for (int n = 1; n <= count; n++) {
        stdout.printf(n == 1 ? "%d" : " %d", a[n]);
    }
    stdout.printf("\n");
}
