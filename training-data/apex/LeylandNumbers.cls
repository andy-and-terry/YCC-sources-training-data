public class LeylandNumbers {
    // Leyland numbers: x^y + y^x for x >= y >= 2.
    public static Long leyland(Integer x, Integer y) {
        return Math.round(Math.pow(x, y) + Math.pow(y, x));
    }

    // Returns 8 17 54 32 145 512.
    public static String firstSix() {
        List<String> vals = new List<String>();
        for (Integer x = 2; x <= 4; x++) {
            for (Integer y = 2; y <= x; y++) {
                vals.add(String.valueOf(leyland(x, y)));
            }
        }
        return String.join(vals, ' ');
    }
}
