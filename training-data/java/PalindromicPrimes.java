// Palindromic primes below 200; expect 10.
public class PalindromicPrimes {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        int c = 0;
        for (int n = 2; n < 200; n++) {
            String s = String.valueOf(n);
            if (s.equals(new StringBuilder(s).reverse().toString()) && isPrime(n)) {
                System.out.print(n + " ");
                c++;
            }
        }
        System.out.println();
        System.out.println(c);
    }
}
