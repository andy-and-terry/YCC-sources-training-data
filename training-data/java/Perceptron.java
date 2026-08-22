import java.util.List;
import java.util.Random;

public class Perceptron {
    private final double[] weights;
    private double bias;
    private final double learningRate;

    public Perceptron(int inputSize, double learningRate, Random random) {
        this.learningRate = learningRate;
        weights = new double[inputSize];
        for (int i = 0; i < inputSize; i++) weights[i] = random.nextDouble() * 2 - 1;
        bias = random.nextDouble() * 2 - 1;
    }

    private int activate(double x) {
        return x >= 0 ? 1 : 0;
    }

    public int predict(double[] inputs) {
        double total = bias;
        for (int i = 0; i < inputs.length; i++) total += weights[i] * inputs[i];
        return activate(total);
    }

    public void train(double[] inputs, int target) {
        int prediction = predict(inputs);
        int error = target - prediction;
        for (int i = 0; i < weights.length; i++) weights[i] += learningRate * error * inputs[i];
        bias += learningRate * error;
    }

    public static void main(String[] args) {
        record Sample(double[] inputs, int target) {}
        List<Sample> data = List.of(
            new Sample(new double[] {0, 0}, 0),
            new Sample(new double[] {0, 1}, 0),
            new Sample(new double[] {1, 0}, 0),
            new Sample(new double[] {1, 1}, 1)
        );
        Perceptron p = new Perceptron(2, 0.1, new Random(1));
        for (int epoch = 0; epoch < 100; epoch++) {
            for (Sample s : data) p.train(s.inputs(), s.target());
        }
        for (Sample s : data) {
            System.out.println(java.util.Arrays.toString(s.inputs()) + " -> " + p.predict(s.inputs()) + " (expected " + s.target() + ")");
        }
    }
}
