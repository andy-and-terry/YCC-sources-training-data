// Twin primes below 50 using a boolean sieve.
public class TwinPrimes {
    public static void main(String[] args) {
        boolean[] s = new boolean[53];
        java.util.Arrays.fill(s, 2, 53, true);
        for (int i = 2; i * i < 53; i++) if (s[i]) for (int j = i * i; j < 53; j += i) s[j] = false;
        StringBuilder sb = new StringBuilder();
        for (int p = 2; p <= 50; p++) if (s[p] && s[p + 2]) sb.append("(").append(p).append(",").append(p + 2).append(") ");
        System.out.println(sb);
    }
}
