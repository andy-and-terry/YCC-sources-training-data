void min_max (int[] values, out int min, out int max) {
    min = values[0];
    max = values[0];
    foreach (int v in values) {
        if (v < min) {
            min = v;
        }
        if (v > max) {
            max = v;
        }
    }
}

void double_in_place (ref int x) {
    x *= 2;
}

bool try_divide (int a, int b, out int quotient) {
    if (b == 0) {
        quotient = 0;
        return false;
    }
    quotient = a / b;
    return true;
}

void main () {
    int lo, hi;
    min_max ({ 7, 3, 9, -2, 5 }, out lo, out hi);
    print ("min=%d max=%d\n", lo, hi);

    int n = 21;
    double_in_place (ref n);
    print ("n=%d\n", n);

    int q;
    if (try_divide (10, 3, out q)) {
        print ("q=%d\n", q);
    }
    if (!try_divide (1, 0, out q)) {
        print ("division failed\n");
    }
}
