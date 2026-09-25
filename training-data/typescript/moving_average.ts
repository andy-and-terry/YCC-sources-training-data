/** Fixed-size ring buffer keeping a running sum, mean, and variance (Welford-style over the window). */
export class RollingStats {
  private buf: number[];
  private i = 0;
  private n = 0;
  private sum = 0;
  private sumSq = 0;

  constructor(private readonly size: number) {
    this.buf = new Array(size).fill(0);
  }

  push(x: number): this {
    if (this.n === this.size) {
      const old = this.buf[this.i];
      this.sum -= old;
      this.sumSq -= old * old;
    } else this.n++;
    this.buf[this.i] = x;
    this.i = (this.i + 1) % this.size;
    this.sum += x;
    this.sumSq += x * x;
    return this;
  }

  get mean(): number {
    return this.n ? this.sum / this.n : NaN;
  }

  get variance(): number {
    return this.n ? this.sumSq / this.n - this.mean ** 2 : NaN;
  }
}

const stats = new RollingStats(3);
for (const p of [10, 11, 12, 13, 12, 11, 15, 18, 17, 16]) {
  stats.push(p);
  console.log(p, stats.mean.toFixed(3), Math.sqrt(stats.variance).toFixed(3));
}
