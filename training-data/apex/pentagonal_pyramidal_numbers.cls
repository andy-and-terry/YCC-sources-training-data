public class PentagonalPyramidalNumbers {
    // n^2(n+1)/2
    public static Integer term(Integer n) {
        Decimal d = ((n * n) * (n + 1)) / 2;
        return d.intValue();
    }

    public static void run() {
        for (Integer n = 1; n <= 15; n++) {
            System.debug(n + ' -> ' + term(n));
        }
    }
}
