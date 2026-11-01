import java.util.StringJoiner;

// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
public class RuthAaronPairs {
    static int sopfr(int n) {
        int total = 0;
        for (int p = 2; p * p <= n; p++)
            while (n % p == 0) { total += p; n /= p; }
        return total + (n > 1 ? n : 0);
    }

    public static void main(String[] args) {
        StringJoiner j = new StringJoiner(" ");
        for (int n = 2; n < 110; n++)
            if (sopfr(n) == sopfr(n + 1)) j.add(Integer.toString(n));
        System.out.println(j);
    }
}
