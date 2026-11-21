// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
public class PerfectTotientNumbers {
    static int gcd(int a, int b) {
        return b == 0 ? a : gcd(b, a % b);
    }

    static int phi(int n) {
        int c = 0;
        for (int k = 1; k <= n; k++) if (gcd(k, n) == 1) c++;
        return c;
    }

    static boolean isPerfectTotient(int n) {
        int total = 0;
        for (int m = n; m > 1; ) {
            m = phi(m);
            total += m;
        }
        return total == n;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 2; n < 200; n++) if (isPerfectTotient(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
