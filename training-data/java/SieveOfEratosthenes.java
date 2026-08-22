import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SieveOfEratosthenes {
    public static List<Integer> sieve(int limit) {
        boolean[] isPrime = new boolean[limit + 1];
        Arrays.fill(isPrime, true);
        if (limit >= 0) isPrime[0] = false;
        if (limit >= 1) isPrime[1] = false;
        for (int n = 2; (long) n * n <= limit; n++) {
            if (isPrime[n]) {
                for (int multiple = n * n; multiple <= limit; multiple += n) {
                    isPrime[multiple] = false;
                }
            }
        }
        List<Integer> primes = new ArrayList<>();
        for (int n = 0; n <= limit; n++) if (isPrime[n]) primes.add(n);
        return primes;
    }

    public static void main(String[] args) {
        System.out.println(sieve(50));
    }
}
