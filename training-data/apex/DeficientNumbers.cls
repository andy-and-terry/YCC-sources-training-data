public class DeficientNumbers {
    static Integer sigma(Integer n) {
        Integer s = 0;
        for (Integer d = 1; d <= n; d++) {
            if (Math.mod(n, d) == 0) s += d;
        }
        return s;
    }

    public static List<Integer> upTo(Integer limit) {
        List<Integer> out = new List<Integer>();
        for (Integer n = 1; n <= limit; n++) {
            if (sigma(n) < 2 * n) out.add(n);
        }
        return out;
    }
}
