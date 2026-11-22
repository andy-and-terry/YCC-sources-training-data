// Emirps: primes whose digit reversal is a different prime.
public class EmirpNumbers {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 2; n < 200; n++) {
            int r = Integer.parseInt(new StringBuilder(String.valueOf(n)).reverse().toString());
            if (r != n && isPrime(n) && isPrime(r)) sb.append(n).append(' ');
        }
        System.out.println(sb.toString().trim());
    }
}
