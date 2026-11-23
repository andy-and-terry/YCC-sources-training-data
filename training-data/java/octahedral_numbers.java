public class OctahedralNumbers {
    // n(2n^2+1)/3
    static long term(long n) {
        return (n * (((2 * n) * n) + 1)) / 3;
    }

    public static void main(String[] args) {
        for (long n = 1; n <= 15; n++) {
            System.out.printf("%2d -> %d%n", n, term(n));
        }
    }
}
