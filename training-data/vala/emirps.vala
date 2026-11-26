// Emirps below 200; expect 15.
class Demo : Object {
    static bool is_prime (int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static string reverse (int n) {
        string s = n.to_string ();
        var sb = new StringBuilder ();
        for (int i = s.length - 1; i >= 0; i--) sb.append_c (s[i]);
        return sb.str;
    }

    public static int main (string[] args) {
        int c = 0;
        for (int n = 2; n < 200; n++) {
            int r = int.parse (reverse (n));
            if (r != n && is_prime (n) && is_prime (r)) c++;
        }
        print ("%d\n", c);
        return 0;
    }
}
