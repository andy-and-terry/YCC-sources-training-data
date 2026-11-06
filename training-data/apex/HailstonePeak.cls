// Highest value reached by the Collatz (hailstone) sequence from n.
public class HailstonePeak {
    public static Long peak(Long n) {
        Long best = n;
        while (n != 1) {
            n = Math.mod(n, 2) == 0 ? n / 2 : 3 * n + 1;
            best = Math.max(best, n);
        }
        return best;
    }

    public static void run() {
        System.debug(peak(27));
    }
}
