import random
from typing import List


class Perceptron:
    def __init__(self, input_size: int, learning_rate: float = 0.1):
        self.weights = [random.uniform(-1, 1) for _ in range(input_size)]
        self.bias = random.uniform(-1, 1)
        self.learning_rate = learning_rate

    def activate(self, x: float) -> int:
        return 1 if x >= 0 else 0

    def predict(self, inputs: List[float]) -> int:
        total = sum(w * x for w, x in zip(self.weights, inputs)) + self.bias
        return self.activate(total)

    def train(self, inputs: List[float], target: int):
        prediction = self.predict(inputs)
        error = target - prediction
        for i in range(len(self.weights)):
            self.weights[i] += self.learning_rate * error * inputs[i]
        self.bias += self.learning_rate * error


if __name__ == "__main__":
    random.seed(1)
    # Train an AND gate
    data = [([0, 0], 0), ([0, 1], 0), ([1, 0], 0), ([1, 1], 1)]
    p = Perceptron(2)
    for _ in range(100):
        for inputs, target in data:
            p.train(inputs, target)
    for inputs, target in data:
        print(inputs, p.predict(inputs), target)
