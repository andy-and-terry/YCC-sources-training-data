class DisjointSet {
  constructor(elements) {
    this.parent = new Map(elements.map((e) => [e, e]));
    this.size = new Map(elements.map((e) => [e, 1]));
  }

  find(x) {
    while (this.parent.get(x) !== x) {
      this.parent.set(x, this.parent.get(this.parent.get(x)));
      x = this.parent.get(x);
    }
    return x;
  }

  union(a, b) {
    let ra = this.find(a);
    let rb = this.find(b);
    if (ra === rb) return;
    if (this.size.get(ra) < this.size.get(rb)) [ra, rb] = [rb, ra];
    this.parent.set(rb, ra);
    this.size.set(ra, this.size.get(ra) + this.size.get(rb));
  }

  connected(a, b) {
    return this.find(a) === this.find(b);
  }
}

const ds = new DisjointSet(['a', 'b', 'c', 'd']);
ds.union('a', 'b');
ds.union('b', 'c');
console.log(ds.connected('a', 'c'), ds.connected('a', 'd'));
module.exports = { DisjointSet };
