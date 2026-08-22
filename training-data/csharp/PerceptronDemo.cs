using System;
using System.Collections.Generic;

class Perceptron
{
    private readonly double[] weights;
    private double bias;
    private readonly double learningRate;

    public Perceptron(int inputSize, double learningRate, Random rng)
    {
        this.learningRate = learningRate;
        weights = new double[inputSize];
        for (int i = 0; i < inputSize; i++) weights[i] = rng.NextDouble() * 2 - 1;
        bias = rng.NextDouble() * 2 - 1;
    }

    private static int Activate(double x) => x >= 0 ? 1 : 0;

    public int Predict(double[] inputs)
    {
        double total = bias;
        for (int i = 0; i < inputs.Length; i++) total += weights[i] * inputs[i];
        return Activate(total);
    }

    public void Train(double[] inputs, int target)
    {
        int prediction = Predict(inputs);
        double error = target - prediction;
        for (int i = 0; i < weights.Length; i++) weights[i] += learningRate * error * inputs[i];
        bias += learningRate * error;
    }

    static void Main()
    {
        var rng = new Random(1);
        var data = new List<(double[], int)>
        {
            (new double[] { 0, 0 }, 0),
            (new double[] { 0, 1 }, 0),
            (new double[] { 1, 0 }, 0),
            (new double[] { 1, 1 }, 1),
        };
        var p = new Perceptron(2, 0.1, rng);
        for (int epoch = 0; epoch < 100; epoch++)
            foreach (var (inputs, target) in data) p.Train(inputs, target);
        foreach (var (inputs, target) in data)
            Console.WriteLine($"{p.Predict(inputs)} (expected {target})");
    }
}
