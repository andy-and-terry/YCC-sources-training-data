public class BaseConversion {
    private static final String DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz";

    public static String toBase(long n, int base) {
        if (base < 2 || base > 36) throw new IllegalArgumentException("base out of range");
        if (n == 0) return "0";
        boolean neg = n < 0;
        StringBuilder sb = new StringBuilder();
        long v = Math.abs(n);
        while (v > 0) {
            sb.append(DIGITS.charAt((int) (v % base)));
            v /= base;
        }
        return (neg ? "-" : "") + sb.reverse();
    }

    public static long fromBase(String s, int base) {
        boolean neg = s.startsWith("-");
        long v = 0;
        for (char c : s.substring(neg ? 1 : 0).toLowerCase().toCharArray()) {
            int d = DIGITS.indexOf(c);
            if (d < 0 || d >= base) throw new NumberFormatException("bad digit " + c);
            v = v * base + d;
        }
        return neg ? -v : v;
    }

    public static void main(String[] args) {
        long[][] cases = {{255, 2}, {255, 16}, {-1295, 36}, {0, 7}, {Long.MAX_VALUE, 36}};
        for (long[] c : cases) {
            String s = toBase(c[0], (int) c[1]);
            System.out.printf("%d base %d = %s (library: %s, roundtrip: %b)%n",
                    c[0], c[1], s, Long.toString(c[0], (int) c[1]), fromBase(s, (int) c[1]) == c[0]);
        }
    }
}
