int64 gcd (int64 a, int64 b) {
    while (b != 0) {
        int64 t = a % b;
        a = b;
        b = t;
    }
    return a;
}

int64 lcm_all (int[] values) {
    int64 result = 1;
    foreach (var v in values) {
        result = result / gcd (result, v) * v;
    }
    return result;
}

void main () {
    int[] a = { 4, 6, 10 };
    int[] b = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    stdout.printf ("lcm(4,6,10) = %" + int64.FORMAT + "\n", lcm_all (a));
    stdout.printf ("lcm(1..10) = %" + int64.FORMAT + "\n", lcm_all (b));
}
