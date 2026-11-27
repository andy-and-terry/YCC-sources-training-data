import java.util.ArrayList;
import java.util.List;

public class CubanPrimes {
    static boolean isPrime(long n) {
        if (n < 2) return false;
        for (long i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        List<Long> out = new ArrayList<>();
        for (long y = 1; out.size() < 8; y++) {
            long p = 3 * y * y + 3 * y + 1;
            if (isPrime(p)) out.add(p);
        }
        System.out.println(out);
    }
}
