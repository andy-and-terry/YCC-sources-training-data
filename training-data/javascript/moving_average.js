class MovingAverage {
  constructor(size) {
    this.size = size;
    this.buf = [];
    this.sum = 0;
  }
  next(v) {
    this.buf.push(v);
    this.sum += v;
    if (this.buf.length > this.size) this.sum -= this.buf.shift();
    return this.sum / this.buf.length;
  }
}

const ma = new MovingAverage(3);
console.log([1, 10, 3, 5, 8, 2].map((v) => ma.next(v).toFixed(2)));
