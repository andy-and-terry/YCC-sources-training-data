// Sophie Germain primes: p prime and 2p + 1 prime.
public class SophieGermainPrimes {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int p = 2; p < 100; p++) if (isPrime(p) && isPrime(2 * p + 1)) sb.append(p).append(' ');
        System.out.println(sb.toString().trim());
    }
}
