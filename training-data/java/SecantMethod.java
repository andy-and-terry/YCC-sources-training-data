import java.util.function.DoubleUnaryOperator;

public class SecantMethod {
    static double secant(DoubleUnaryOperator f, double a, double b) {
        for (int i = 0; i < 40; i++) {
            double fa = f.applyAsDouble(a), fb = f.applyAsDouble(b);
            if (fa == fb) break;
            double c = b - fb * (b - a) / (fb - fa);
            a = b;
            b = c;
        }
        return b;
    }

    public static void main(String[] args) {
        System.out.printf("%.8f%n", secant(x -> x * x - 2, 1, 2));
    }
}
