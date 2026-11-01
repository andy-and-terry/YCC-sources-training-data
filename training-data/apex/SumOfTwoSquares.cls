public class SumOfTwoSquares {
    // Positive n expressible as a*a + b*b with a, b >= 0.
    public static Boolean representable(Integer n) {
        for (Integer a = 0; a * a <= n; a++) {
            for (Integer b = a; a * a + b * b <= n; b++) {
                if (a * a + b * b == n) return true;
            }
        }
        return false;
    }

    public static String upToThirty() {
        List<String> out = new List<String>();
        for (Integer n = 1; n <= 30; n++) {
            if (representable(n)) out.add(String.valueOf(n));
        }
        return String.join(out, ' ');
    }
}
