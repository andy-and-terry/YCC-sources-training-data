import java.util.ArrayList;
import java.util.List;

public class SophieGermainPrimes {
    static boolean isPrime(long n) {
        if (n < 2) return false;
        for (long i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        List<Long> found = new ArrayList<>();
        for (long p = 2; found.size() < 10; p++) {
            if (isPrime(p) && isPrime(2 * p + 1)) found.add(p);
        }
        System.out.println(found); // [2, 3, 5, 11, 23, 29, 41, 53, 83, 89]
    }
}
