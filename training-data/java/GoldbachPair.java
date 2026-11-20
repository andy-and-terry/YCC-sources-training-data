// Goldbach pair for an even number.
public class GoldbachPair {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        int n = 28;
        for (int p = 2; p <= n / 2; p++) {
            if (isPrime(p) && isPrime(n - p)) {
                System.out.println(p + " + " + (n - p));
                break;
            }
        }
    }
}
