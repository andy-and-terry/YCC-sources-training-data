import java.util.function.DoubleUnaryOperator;

public class NewtonSqrt {
    public static double newton(DoubleUnaryOperator f, DoubleUnaryOperator df, double x0, double tol) {
        double x = x0;
        for (int i = 0; i < 100; i++) {
            double next = x - f.applyAsDouble(x) / df.applyAsDouble(x);
            if (Math.abs(next - x) < tol) return next;
            x = next;
        }
        throw new ArithmeticException("did not converge");
    }

    public static double sqrt(double a) {
        if (a < 0) throw new IllegalArgumentException("negative input");
        if (a == 0) return 0;
        return newton(x -> x * x - a, x -> 2 * x, Math.max(a, 1), 1e-12);
    }

    public static void main(String[] args) {
        for (double v : new double[] {2, 9, 0.25, 1e10}) System.out.printf("sqrt(%s) = %.12f (Math: %.12f)%n", v, sqrt(v), Math.sqrt(v));
        System.out.println("root of cos(x) - x: " + newton(x -> Math.cos(x) - x, x -> -Math.sin(x) - 1, 1, 1e-12));
    }
}
