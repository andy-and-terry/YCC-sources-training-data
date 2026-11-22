// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
public class PracticalNumbers {
    static Boolean isPractical(Integer n) {
        Set<Integer> reach = new Set<Integer>{ 0 };
        for (Integer d = 1; d <= n; d++) {
            if (Math.mod(n, d) == 0) {
                Set<Integer> grown = new Set<Integer>(reach);
                for (Integer r : reach) grown.add(r + d);
                reach = grown;
            }
        }
        for (Integer m = 1; m <= n; m++) {
            if (!reach.contains(m)) return false;
        }
        return true;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 1; n <= 40; n++) {
            if (isPractical(n)) out.add(n);
        }
        System.debug(String.join(out, ' '));
    }
}
