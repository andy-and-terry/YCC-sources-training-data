// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
bool is_keith (int n) {
    string str = n.to_string ();
    int[] seq = new int[64];
    int k = str.length;
    for (int i = 0; i < k; i++) seq[i] = str[i] - '0';
    int len = k;
    while (seq[len - 1] < n) {
        int sum = 0;
        for (int i = len - k; i < len; i++) sum += seq[i];
        seq[len] = sum;
        len++;
    }
    return seq[len - 1] == n;
}

void main () {
    for (int n = 10; n < 1200; n++) {
        if (is_keith (n)) print ("%d ", n);
    }
    print ("\n");
}
