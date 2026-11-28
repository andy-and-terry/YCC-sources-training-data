public class SecantMethod {
    private static Double f(Double x) { return x * x - 2; }

    public static Double secant(Double x0, Double x1) {
        for (Integer i = 0; i < 50; i++) {
            Double f0 = f(x0), f1 = f(x1);
            if (f1 == f0) break;
            Double next = x1 - f1 * (x1 - x0) / (f1 - f0);
            x0 = x1;
            x1 = next;
            if (Math.abs(x1 - x0) < 1e-12) break;
        }
        return x1;
    }

    public static void demo() {
        System.debug(secant(1, 2));
    }
}
