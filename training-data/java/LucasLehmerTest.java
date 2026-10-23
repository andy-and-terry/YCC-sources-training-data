import java.util.StringJoiner;

public class LucasLehmerTest {
    static boolean isPrime(int n) {
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return n > 1;
    }

    static boolean lucasLehmer(int p) {
        if (p == 2) return true;
        long m = (1L << p) - 1;
        long s = 4;
        for (int i = 0; i < p - 2; i++) s = (s * s - 2 + m) % m;
        return s == 0;
    }

    public static void main(String[] args) {
        StringJoiner out = new StringJoiner(" ");
        for (int p = 2; p <= 19; p++) {
            if (isPrime(p) && lucasLehmer(p)) out.add(Integer.toString(p));
        }
        System.out.println(out);
    }
}
