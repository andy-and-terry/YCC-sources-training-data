// Goldbach partitions of 100; expect 6.
public class GoldbachPairs {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        int c = 0;
        for (int p = 2; p <= 50; p++) {
            if (isPrime(p) && isPrime(100 - p)) { System.out.println(p + "+" + (100 - p)); c++; }
        }
        System.out.println(c);
    }
}
