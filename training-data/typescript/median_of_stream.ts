class MedianFinder {
  private values: number[] = [];

  addNum(num: number): void {
    let low = 0;
    let high = this.values.length;
    while (low < high) {
      const mid = Math.floor((low + high) / 2);
      if (this.values[mid] < num) low = mid + 1;
      else high = mid;
    }
    this.values.splice(low, 0, num);
  }

  findMedian(): number {
    const n = this.values.length;
    const mid = Math.floor(n / 2);
    return n % 2 === 0 ? (this.values[mid - 1] + this.values[mid]) / 2 : this.values[mid];
  }
}

const mf = new MedianFinder();
[5, 15, 1, 3].forEach((n) => mf.addNum(n));
console.log(mf.findMedian());
