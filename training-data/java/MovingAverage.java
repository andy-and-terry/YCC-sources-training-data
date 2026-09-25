import java.util.ArrayDeque;
import java.util.Deque;

public class MovingAverage {
    private final int size;
    private final Deque<Double> window = new ArrayDeque<>();
    private double sum;

    public MovingAverage(int size) { this.size = size; }

    public double next(double x) {
        window.addLast(x);
        sum += x;
        if (window.size() > size) sum -= window.removeFirst();
        return sum / window.size();
    }

    public static double[] ema(double[] values, double alpha) {
        double[] out = new double[values.length];
        for (int i = 0; i < values.length; i++) out[i] = i == 0 ? values[0] : alpha * values[i] + (1 - alpha) * out[i - 1];
        return out;
    }

    public static void main(String[] args) {
        double[] prices = {10, 11, 12, 13, 12, 11, 15, 18, 17, 16};
        MovingAverage sma = new MovingAverage(3);
        double[] e = ema(prices, 0.5);
        for (int i = 0; i < prices.length; i++) System.out.printf("%5.1f  sma=%7.3f  ema=%7.3f%n", prices[i], sma.next(prices[i]), e[i]);
    }
}
