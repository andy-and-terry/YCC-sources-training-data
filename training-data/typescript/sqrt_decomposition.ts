class SqrtSum {
  private blk: number[];
  constructor(private a: number[], private bs: number) {
    this.blk = new Array(Math.ceil(a.length / bs)).fill(0);
    a.forEach((v, i) => (this.blk[Math.floor(i / bs)] += v));
  }
  query(l: number, r: number): number {
    let s = 0;
    for (let i = l; i <= r; ) {
      if (i % this.bs === 0 && i + this.bs - 1 <= r) {
        s += this.blk[i / this.bs];
        i += this.bs;
      } else s += this.a[i++];
    }
    return s;
  }
}
console.log(new SqrtSum([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4).query(2, 9));
