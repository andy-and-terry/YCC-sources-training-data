import java.util.ArrayDeque;
import java.util.Deque;

public class MovingAverage {
    private final Deque<Double> window = new ArrayDeque<>();
    private final int size;
    private double sum;

    MovingAverage(int size) { this.size = size; }

    double next(double v) {
        window.addLast(v);
        sum += v;
        if (window.size() > size) sum -= window.removeFirst();
        return sum / window.size();
    }

    public static void main(String[] args) {
        MovingAverage ma = new MovingAverage(3);
        for (double v : new double[] {1, 10, 3, 5, 8, 2}) System.out.printf("%.2f ", ma.next(v));
        System.out.println();
    }
}
