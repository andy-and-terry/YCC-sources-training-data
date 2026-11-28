import java.util.function.DoubleUnaryOperator;

public class SecantMethod {
    static double secant(DoubleUnaryOperator f, double x0, double x1) {
        for (int i = 0; i < 50; i++) {
            double f0 = f.applyAsDouble(x0), f1 = f.applyAsDouble(x1);
            if (f1 == f0) break;
            double next = x1 - f1 * (x1 - x0) / (f1 - f0);
            x0 = x1;
            x1 = next;
            if (Math.abs(x1 - x0) < 1e-12) break;
        }
        return x1;
    }

    public static void main(String[] args) {
        System.out.println(secant(x -> x * x - 2, 1, 2));
    }
}
