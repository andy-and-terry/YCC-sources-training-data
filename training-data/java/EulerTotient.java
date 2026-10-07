import java.util.Arrays;

public class EulerTotient {
    public static long phi(long n) {
        long result = n;
        for (long p = 2; p * p <= n; p++) {
            if (n % p == 0) {
                while (n % p == 0) n /= p;
                result -= result / p;
            }
        }
        if (n > 1) result -= result / n;
        return result;
    }

    public static int[] sieve(int limit) {
        int[] phi = new int[limit + 1];
        for (int i = 0; i <= limit; i++) phi[i] = i;
        for (int i = 2; i <= limit; i++) {
            if (phi[i] == i) for (int j = i; j <= limit; j += i) phi[j] -= phi[j] / i;
        }
        return phi;
    }

    public static void main(String[] args) {
        int[] s = sieve(20);
        System.out.println(Arrays.toString(Arrays.copyOfRange(s, 1, 21)));
        long sum = 0;
        int[] big = sieve(1_000_000);
        for (int i = 2; i <= 1_000_000; i++) sum += big[i];
        System.out.println("Farey sequence length F(1e6) - 2 = " + sum + ", phi(10^12) = " + phi(1_000_000_000_000L));
    }
}
