export class MovingAverage {
  private readonly buf: number[];
  private idx = 0;
  private count = 0;
  private sum = 0;

  constructor(private readonly size: number) {
    this.buf = new Array<number>(size).fill(0);
  }

  next(v: number): number {
    this.sum += v - this.buf[this.idx];
    this.buf[this.idx] = v;
    this.idx = (this.idx + 1) % this.size;
    this.count = Math.min(this.count + 1, this.size);
    return this.sum / this.count;
  }
}

const ma = new MovingAverage(3);
console.log([1, 10, 3, 5, 8, 2].map((v) => ma.next(v).toFixed(2)));
