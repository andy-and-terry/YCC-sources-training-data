class FenwickTree {
  private tree: number[];

  constructor(private size: number) {
    this.tree = new Array(size + 1).fill(0);
  }

  add(index: number, delta: number): void {
    index += 1;
    while (index <= this.size) {
      this.tree[index] += delta;
      index += index & -index;
    }
  }

  prefixSum(index: number): number {
    index += 1;
    let total = 0;
    while (index > 0) {
      total += this.tree[index];
      index -= index & -index;
    }
    return total;
  }

  rangeSum(left: number, right: number): number {
    return this.prefixSum(right) - (left > 0 ? this.prefixSum(left - 1) : 0);
  }
}

const ft = new FenwickTree(6);
[1, 3, 5, 7, 9, 11].forEach((v, i) => ft.add(i, v));
console.log(ft.rangeSum(1, 3));
