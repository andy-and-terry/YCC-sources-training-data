// Squarefree numbers up to 100; expect 61.
class Demo : Object {
    static bool squarefree (int n) {
        for (int d = 2; d * d <= n; d++) if (n % (d * d) == 0) return false;
        return true;
    }

    public static int main (string[] args) {
        int c = 0;
        for (int n = 1; n <= 100; n++) if (squarefree (n)) c++;
        print ("%d\n", c);
        return 0;
    }
}
