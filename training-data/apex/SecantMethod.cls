public class SecantMethod {
    public static Double f(Double x) { return x * x - 2; }

    public static Double solve(Double a, Double b) {
        for (Integer i = 0; i < 40; i++) {
            Double fa = f(a), fb = f(b);
            if (fa == fb) break;
            Double c = b - fb * (b - a) / (fb - fa);
            a = b;
            b = c;
        }
        return b;
    }
}
