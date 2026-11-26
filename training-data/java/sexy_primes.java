// Sexy primes below 100; expect 16 pairs.
public class SexyPrimes {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        int c = 0;
        for (int p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 6)) c++;
        System.out.println(c);
    }
}
