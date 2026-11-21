import java.math.BigInteger;

// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
public class CarmichaelNumbers {
    static int gcd(int a, int b) {
        return b == 0 ? a : gcd(b, a % b);
    }

    static boolean isPrime(int n) {
        for (int p = 2; p * p <= n; p++) if (n % p == 0) return false;
        return n > 1;
    }

    static boolean isCarmichael(int n) {
        if (isPrime(n)) return false;
        BigInteger mod = BigInteger.valueOf(n);
        for (int a = 2; a < n; a++) {
            if (gcd(a, n) == 1 && !BigInteger.valueOf(a).modPow(BigInteger.valueOf(n - 1), mod).equals(BigInteger.ONE))
                return false;
        }
        return true;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 3; n < 3000; n += 2) if (isCarmichael(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
