// Circular primes below 100; expect 13.
class Demo : Object {
    static bool is_prime (int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static bool circular (int n) {
        string s = n.to_string ();
        for (int i = 0; i < s.length; i++) {
            if (!is_prime (int.parse (s.substring (i) + s.substring (0, i)))) return false;
        }
        return true;
    }

    public static int main (string[] args) {
        int c = 0;
        for (int n = 2; n < 100; n++) if (circular (n)) c++;
        print ("%d\n", c);
        return 0;
    }
}
