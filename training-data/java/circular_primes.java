// Circular primes below 100; expect 13.
public class CircularPrimes {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static boolean circular(int n) {
        String s = String.valueOf(n);
        for (int i = 0; i < s.length(); i++)
            if (!isPrime(Integer.parseInt(s.substring(i) + s.substring(0, i)))) return false;
        return true;
    }

    public static void main(String[] args) {
        int c = 0;
        for (int n = 2; n < 100; n++) if (circular(n)) c++;
        System.out.println(c);
    }
}
