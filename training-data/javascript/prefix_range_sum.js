class RangeSum {
  constructor(values) {
    this.prefix = [0];
    for (const v of values) this.prefix.push(this.prefix[this.prefix.length - 1] + v);
  }
  query(lo, hi) {
    return this.prefix[hi] - this.prefix[lo];
  }
}

console.log(new RangeSum([3, 1, 4, 1, 5, 9, 2, 6]).query(2, 5));
