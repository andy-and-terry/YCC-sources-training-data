class Perceptron {
  private weights: number[];
  private bias: number;

  constructor(inputSize: number, private learningRate = 0.1) {
    this.weights = Array.from({ length: inputSize }, () => Math.random() * 2 - 1);
    this.bias = Math.random() * 2 - 1;
  }

  private activate(x: number): number {
    return x >= 0 ? 1 : 0;
  }

  predict(inputs: number[]): number {
    const total = inputs.reduce((sum, x, i) => sum + this.weights[i] * x, this.bias);
    return this.activate(total);
  }

  train(inputs: number[], target: number): void {
    const prediction = this.predict(inputs);
    const error = target - prediction;
    for (let i = 0; i < this.weights.length; i++) {
      this.weights[i] += this.learningRate * error * inputs[i];
    }
    this.bias += this.learningRate * error;
  }
}

const data: [number[], number][] = [
  [[0, 0], 0],
  [[0, 1], 0],
  [[1, 0], 0],
  [[1, 1], 1],
];
const p = new Perceptron(2);
for (let epoch = 0; epoch < 100; epoch++) {
  for (const [inputs, target] of data) p.train(inputs, target);
}
for (const [inputs, target] of data) console.log(inputs, p.predict(inputs), target);
