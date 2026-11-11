// Highest value reached by the Collatz (hailstone) sequence from n.
public class HailstonePeak {
    static long peak(long n) {
        long best = n;
        while (n != 1) {
            n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
            best = Math.max(best, n);
        }
        return best;
    }

    public static void main(String[] args) {
        System.out.println(peak(27));
    }
}
