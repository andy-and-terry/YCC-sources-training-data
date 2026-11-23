public class PentatopeNumbers {
    // n(n+1)(n+2)(n+3)/24
    public static Integer term(Integer n) {
        Decimal d = (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24;
        return d.intValue();
    }

    public static void run() {
        for (Integer n = 1; n <= 15; n++) {
            System.debug(n + ' -> ' + term(n));
        }
    }
}
