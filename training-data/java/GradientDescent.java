import java.util.function.DoubleUnaryOperator;

public class GradientDescent {
    public static double gradientDescent(DoubleUnaryOperator gradFn, double start, double learningRate, int iterations) {
        double x = start;
        for (int i = 0; i < iterations; i++) {
            x -= learningRate * gradFn.applyAsDouble(x);
        }
        return x;
    }

    public static void main(String[] args) {
        double minimum = gradientDescent(x -> 2 * (x - 3), 0, 0.1, 50);
        System.out.printf("%.4f%n", minimum);
    }
}
