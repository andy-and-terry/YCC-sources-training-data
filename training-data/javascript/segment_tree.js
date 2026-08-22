class SegmentTree {
  constructor(data) {
    this.n = data.length;
    this.tree = new Array(2 * this.n).fill(0);
    for (let i = 0; i < this.n; i++) this.tree[this.n + i] = data[i];
    for (let i = this.n - 1; i > 0; i--) this.tree[i] = this.tree[2 * i] + this.tree[2 * i + 1];
  }

  update(index, value) {
    let i = index + this.n;
    this.tree[i] = value;
    while (i > 1) {
      i = Math.floor(i / 2);
      this.tree[i] = this.tree[2 * i] + this.tree[2 * i + 1];
    }
  }

  query(left, right) {
    left += this.n;
    right += this.n;
    let total = 0;
    while (left < right) {
      if (left % 2 === 1) total += this.tree[left++];
      if (right % 2 === 1) total += this.tree[--right];
      left = Math.floor(left / 2);
      right = Math.floor(right / 2);
    }
    return total;
  }
}

const tree = new SegmentTree([1, 3, 5, 7, 9, 11]);
console.log(tree.query(1, 4));
tree.update(1, 10);
console.log(tree.query(1, 4));
module.exports = { SegmentTree };
