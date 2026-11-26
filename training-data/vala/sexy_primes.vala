// Sexy primes below 100; expect 16 pairs.
class Demo : Object {
    static bool is_prime (int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static int main (string[] args) {
        int c = 0;
        for (int p = 2; p < 100; p++) if (is_prime (p) && is_prime (p + 6)) c++;
        print ("%d\n", c);
        return 0;
    }
}
