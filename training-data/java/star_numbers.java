public class StarNumbers {
    // 6n(n-1)+1
    static long term(long n) {
        return ((6 * n) * (n - 1)) + 1;
    }

    public static void main(String[] args) {
        for (long n = 1; n <= 15; n++) {
            System.out.printf("%2d -> %d%n", n, term(n));
        }
    }
}
