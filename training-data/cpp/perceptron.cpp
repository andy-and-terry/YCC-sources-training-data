#include <iostream>
#include <random>
#include <vector>

class Perceptron {
public:
    Perceptron(int inputSize, double learningRate, std::mt19937& rng)
        : weights(inputSize), learningRate(learningRate) {
        std::uniform_real_distribution<double> dist(-1.0, 1.0);
        for (auto& w : weights) w = dist(rng);
        bias = dist(rng);
    }

    int predict(const std::vector<double>& inputs) const {
        double total = bias;
        for (size_t i = 0; i < inputs.size(); i++) total += weights[i] * inputs[i];
        return total >= 0 ? 1 : 0;
    }

    void train(const std::vector<double>& inputs, int target) {
        int prediction = predict(inputs);
        double error = target - prediction;
        for (size_t i = 0; i < weights.size(); i++) weights[i] += learningRate * error * inputs[i];
        bias += learningRate * error;
    }

private:
    std::vector<double> weights;
    double bias, learningRate;
};

int main() {
    std::mt19937 rng(1);
    std::vector<std::pair<std::vector<double>, int>> data = {
        {{0, 0}, 0}, {{0, 1}, 0}, {{1, 0}, 0}, {{1, 1}, 1}};
    Perceptron p(2, 0.1, rng);
    for (int epoch = 0; epoch < 100; epoch++) {
        for (auto& [inputs, target] : data) p.train(inputs, target);
    }
    for (auto& [inputs, target] : data) {
        std::cout << p.predict(inputs) << " (expected " << target << ")" << std::endl;
    }
    return 0;
}
