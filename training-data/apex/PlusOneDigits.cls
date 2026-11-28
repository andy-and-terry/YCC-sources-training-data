public class PlusOneDigits {
    public static List<Integer> plusOne(List<Integer> digits) {
        List<Integer> d = digits.clone();
        for (Integer i = d.size() - 1; i >= 0; i--) {
            if (d[i] < 9) {
                d[i]++;
                return d;
            }
            d[i] = 0;
        }
        d.add(0, 1);
        return d;
    }

    public static void demo() {
        System.debug(plusOne(new List<Integer>{1, 2, 9})); // (1, 3, 0)
        System.debug(plusOne(new List<Integer>{9, 9}));    // (1, 0, 0)
    }
}
