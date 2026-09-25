class SimpleMovingAverage {
  constructor(size) {
    this.size = size;
    this.window = [];
    this.total = 0;
  }
  add(x) {
    this.window.push(x);
    this.total += x;
    if (this.window.length > this.size) this.total -= this.window.shift();
    return this.total / this.window.length;
  }
}

function ema(values, alpha) {
  let cur;
  return values.map((v) => +(cur = cur === undefined ? v : alpha * v + (1 - alpha) * cur).toFixed(3));
}

const prices = [10, 11, 12, 13, 12, 11, 15, 18, 17, 16];
const sma = new SimpleMovingAverage(3);
console.log(prices.map((p) => +sma.add(p).toFixed(3)).join(" "));
console.log(ema(prices, 0.5).join(" "));
module.exports = { SimpleMovingAverage, ema };
