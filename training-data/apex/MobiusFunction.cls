// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
public class MobiusFunction {
    public static Integer mobius(Integer n) {
        Integer result = 1;
        for (Integer p = 2; p * p <= n; p++) {
            if (Math.mod(n, p) == 0) {
                n = n / p;
                if (Math.mod(n, p) == 0) return 0;
                result = -result;
            }
        }
        return n > 1 ? -result : result;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 1; n <= 30; n++) out.add(mobius(n));
        System.debug(String.join(out, ' '));
    }
}
