// Primorials up to 1e6, including 1; expect 8.
public class PrimorialNumbers {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        java.util.List<Long> v = new java.util.ArrayList<>();
        v.add(1L);
        long acc = 1;
        for (int p = 2; ; p++) {
            if (!isPrime(p)) continue;
            acc *= p;
            if (acc > 1_000_000) break;
            v.add(acc);
        }
        System.out.println(v);
        System.out.println(v.size());
    }
}
