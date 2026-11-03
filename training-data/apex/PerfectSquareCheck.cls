public class PerfectSquareCheck {
    public static Boolean isPerfectSquare(Integer n) {
        if (n < 0) return false;
        Integer r = (Integer) Math.sqrt(n);
        return r * r == n;
    }

    public static List<Integer> upTo(Integer limit) {
        List<Integer> out = new List<Integer>();
        for (Integer n = 0; n < limit; n++) {
            if (isPerfectSquare(n)) out.add(n);
        }
        return out;
    }
}
