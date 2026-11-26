// Deficient numbers below 100; expect 76.
public class DeficientNumbers {
    static Integer properSum(Integer n) {
        Integer t = 0;
        for (Integer d = 1; d < n; d++) {
            if (Math.mod(n, d) == 0) t += d;
        }
        return t;
    }

    public static void run() {
        Integer c = 0;
        for (Integer n = 1; n < 100; n++) {
            if (properSum(n) < n) c++;
        }
        System.debug(c);
    }
}
