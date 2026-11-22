// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
public class PracticalNumbers {
    static boolean isPractical(int n) {
        long reach = 1L; // bit i set <=> i is a subset sum
        for (int d = 1; d <= n; d++) if (n % d == 0) reach |= reach << d;
        long mask = (1L << (n + 1)) - 1;
        return (reach & mask) == mask;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n <= 40; n++) if (isPractical(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
