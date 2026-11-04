public class BaseNConvert {
    private static final String DIGITS = '0123456789abcdefghijklmnopqrstuvwxyz';

    public static String toBase(Integer n, Integer base) {
        if (n == 0) return '0';
        String out = '';
        while (n > 0) {
            Integer d = Math.mod(n, base);
            out = DIGITS.substring(d, d + 1) + out;
            n = n / base;
        }
        return out;
    }
}
