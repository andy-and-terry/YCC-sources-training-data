public class PerfectSquareCheck {
    static boolean isPerfectSquare(long n) {
        if (n < 0) return false;
        long r = (long) Math.sqrt((double) n);
        return r * r == n;
    }

    public static void main(String[] args) {
        for (int n = 0; n < 30; n++) if (isPerfectSquare(n)) System.out.print(n + " ");
        System.out.println();
    }
}
