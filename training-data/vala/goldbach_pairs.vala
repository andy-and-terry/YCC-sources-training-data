// Goldbach partitions of 100; expect 6.
class Demo : Object {
    static bool is_prime (int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static int main (string[] args) {
        int c = 0;
        for (int p = 2; p <= 50; p++) {
            if (is_prime (p) && is_prime (100 - p)) {
                print ("%d+%d\n", p, 100 - p);
                c++;
            }
        }
        print ("%d\n", c);
        return 0;
    }
}
