import java.util.StringJoiner;

// Pernicious numbers: the popcount is prime.
public class PerniciousNumbers {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++)
            if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        StringJoiner j = new StringJoiner(" ");
        for (int n = 1; n <= 20; n++)
            if (isPrime(Integer.bitCount(n))) j.add(Integer.toString(n));
        System.out.println(j);
    }
}
