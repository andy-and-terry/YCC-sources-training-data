public class TriangularCheck {
    // n is triangular iff 8n + 1 is a perfect square.
    public static Boolean isTriangular(Integer n) {
        Integer s = 8 * n + 1;
        Integer r = Math.round(Math.sqrt(s));
        return r * r == s;
    }

    public static String upToTwenty() {
        List<String> out = new List<String>();
        for (Integer n = 0; n <= 20; n++) {
            if (isTriangular(n)) out.add(String.valueOf(n));
        }
        return String.join(out, ' ');
    }
}
