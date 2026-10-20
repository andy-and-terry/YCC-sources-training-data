const priv = new WeakMap();
class Counter {
  constructor() { priv.set(this, { n: 0 }); }
  inc() { return ++priv.get(this).n; }
}
const c = new Counter();
c.inc();
console.log(c.inc());
