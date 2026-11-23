public class LazyCatererSequence {
    // n(n+1)/2+1
    public static Integer term(Integer n) {
        Decimal d = ((n * (n + 1)) / 2) + 1;
        return d.intValue();
    }

    public static void run() {
        for (Integer n = 1; n <= 15; n++) {
            System.debug(n + ' -> ' + term(n));
        }
    }
}
