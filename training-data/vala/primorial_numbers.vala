// Primorials up to 1e6, including 1; expect 8.
class Demo : Object {
    static bool is_prime (int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static int main (string[] args) {
        int64 acc = 1;
        int c = 1;
        for (int p = 2; ; p++) {
            if (!is_prime (p)) continue;
            acc *= p;
            if (acc > 1000000) break;
            c++;
        }
        print ("%d\n", c);
        return 0;
    }
}
