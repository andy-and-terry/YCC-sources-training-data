void main() {
    int count = 20;
    int[] q = new int[count + 1];
    q[1] = 1;
    q[2] = 1;
    for (int n = 3; n <= count; n++) {
        q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
    }
    for (int n = 1; n <= count; n++) {
        stdout.printf(n == 1 ? "%d" : " %d", q[n]);
    }
    stdout.printf("\n");
}
