public class DigitalRoot {
    public static long iterative(long n) {
        while (n >= 10) {
            long s = 0;
            for (; n > 0; n /= 10) s += n % 10;
            n = s;
        }
        return n;
    }

    public static long congruence(long n) {
        return n == 0 ? 0 : 1 + (n - 1) % 9;
    }

    public static void main(String[] args) {
        for (long n : new long[] {0, 16, 942, 132189, 493193, 999999999999L}) {
            if (iterative(n) != congruence(n)) throw new AssertionError(n);
            System.out.println(n + " -> " + congruence(n));
        }
    }
}
