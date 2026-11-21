// Disarium numbers: digits raised to their 1-based positions sum to n.
bool is_disarium (int n) {
    string s = n.to_string ();
    int sum = 0;
    for (int i = 0; i < s.length; i++) {
        int d = s[i] - '0';
        int p = 1;
        for (int e = 0; e <= i; e++) p *= d;
        sum += p;
    }
    return sum == n;
}

void main () {
    for (int n = 1; n < 1000; n++) {
        if (is_disarium (n)) print ("%d ", n);
    }
    print ("\n");
}
