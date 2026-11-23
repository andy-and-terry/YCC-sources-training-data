public class SquarePyramidalNumbers {
    // n(n+1)(2n+1)/6
    static long term(long n) {
        return ((n * (n + 1)) * ((2 * n) + 1)) / 6;
    }

    public static void main(String[] args) {
        for (long n = 1; n <= 15; n++) {
            System.out.printf("%2d -> %d%n", n, term(n));
        }
    }
}
