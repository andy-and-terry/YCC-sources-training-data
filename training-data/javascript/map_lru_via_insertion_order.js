class LRU {
  constructor(n) { this.n = n; this.m = new Map(); }
  get(k) {
    if (!this.m.has(k)) return undefined;
    const v = this.m.get(k);
    this.m.delete(k); this.m.set(k, v);
    return v;
  }
  set(k, v) {
    this.m.delete(k); this.m.set(k, v);
    if (this.m.size > this.n) this.m.delete(this.m.keys().next().value);
  }
}
const c = new LRU(2);
c.set("a", 1); c.set("b", 2); c.get("a"); c.set("c", 3);
console.log([...c.m.keys()]);
