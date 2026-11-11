// Narayana's cows N(n)=N(n-1)+N(n-3)
void main () {
    int[] v = new int[10];
    v[0] = 1; v[1] = 1; v[2] = 1;
    for (int i = 3; i < 10; i++) {
        v[i] = v[i - 1] + v[i - 3];
    }
    foreach (int x in v) {
        stdout.printf ("%d ", x);
    }
    stdout.printf ("\n");
}
