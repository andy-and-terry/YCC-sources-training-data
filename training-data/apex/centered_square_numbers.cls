public class CenteredSquareNumbers {
    // 2n(n-1)+1
    public static Integer term(Integer n) {
        Decimal d = ((2 * n) * (n - 1)) + 1;
        return d.intValue();
    }

    public static void run() {
        for (Integer n = 1; n <= 15; n++) {
            System.debug(n + ' -> ' + term(n));
        }
    }
}
