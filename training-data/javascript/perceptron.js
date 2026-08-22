class Perceptron {
  constructor(inputSize, learningRate = 0.1) {
    this.weights = Array.from({ length: inputSize }, () => Math.random() * 2 - 1);
    this.bias = Math.random() * 2 - 1;
    this.learningRate = learningRate;
  }

  activate(x) {
    return x >= 0 ? 1 : 0;
  }

  predict(inputs) {
    const total = inputs.reduce((sum, x, i) => sum + this.weights[i] * x, this.bias);
    return this.activate(total);
  }

  train(inputs, target) {
    const prediction = this.predict(inputs);
    const error = target - prediction;
    for (let i = 0; i < this.weights.length; i++) {
      this.weights[i] += this.learningRate * error * inputs[i];
    }
    this.bias += this.learningRate * error;
  }
}

const data = [
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
module.exports = { Perceptron };
