#include <functional>
#include <iostream>

double gradientDescent(std::function<double(double)> gradFn, double start, double learningRate, int iterations) {
    double x = start;
    for (int i = 0; i < iterations; i++) x -= learningRate * gradFn(x);
    return x;
}

int main() {
    double minimum = gradientDescent([](double x) { return 2 * (x - 3); }, 0, 0.1, 50);
    std::cout << minimum << std::endl;
    return 0;
}
