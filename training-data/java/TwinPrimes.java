// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
public class TwinPrimes {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 2)) sb.append(p).append(' ');
        System.out.println(sb.toString().trim());
    }
}
