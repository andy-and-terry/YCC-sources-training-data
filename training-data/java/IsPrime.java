import java.util.ArrayList;
import java.util.List;

public class IsPrime {
    public static boolean isPrime(int n) {
        if (n < 2) return false;
        if (n == 2 || n == 3) return true;
        if (n % 2 == 0) return false;
        for (int i = 3; (long) i * i <= n; i += 2) {
            if (n % i == 0) return false;
        }
        return true;
    }

    public static void main(String[] args) {
        List<Integer> primes = new ArrayList<>();
        for (int n = 0; n < 20; n++) {
            if (isPrime(n)) primes.add(n);
        }
        System.out.println(primes);
    }
}
