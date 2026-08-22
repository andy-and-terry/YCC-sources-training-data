class FenwickTree {
  constructor(size) {
    this.size = size;
    this.tree = new Array(size + 1).fill(0);
  }

  add(index, delta) {
    index += 1;
    while (index <= this.size) {
      this.tree[index] += delta;
      index += index & -index;
    }
  }

  prefixSum(index) {
    index += 1;
    let total = 0;
    while (index > 0) {
      total += this.tree[index];
      index -= index & -index;
    }
    return total;
  }

  rangeSum(left, right) {
    return this.prefixSum(right) - (left > 0 ? this.prefixSum(left - 1) : 0);
  }
}

const ft = new FenwickTree(6);
[1, 3, 5, 7, 9, 11].forEach((v, i) => ft.add(i, v));
console.log(ft.rangeSum(1, 3));
module.exports = { FenwickTree };
