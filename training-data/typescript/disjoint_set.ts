class DisjointSet<T> {
  private parent = new Map<T, T>();
  private size = new Map<T, number>();

  constructor(elements: T[]) {
    for (const e of elements) {
      this.parent.set(e, e);
      this.size.set(e, 1);
    }
  }

  find(x: T): T {
    while (this.parent.get(x) !== x) {
      this.parent.set(x, this.parent.get(this.parent.get(x)!)!);
      x = this.parent.get(x)!;
    }
    return x;
  }

  union(a: T, b: T): void {
    let ra = this.find(a);
    let rb = this.find(b);
    if (ra === rb) return;
    if (this.size.get(ra)! < this.size.get(rb)!) [ra, rb] = [rb, ra];
    this.parent.set(rb, ra);
    this.size.set(ra, this.size.get(ra)! + this.size.get(rb)!);
  }

  connected(a: T, b: T): boolean {
    return this.find(a) === this.find(b);
  }
}

const ds = new DisjointSet(['a', 'b', 'c', 'd']);
ds.union('a', 'b');
ds.union('b', 'c');
console.log(ds.connected('a', 'c'), ds.connected('a', 'd'));
