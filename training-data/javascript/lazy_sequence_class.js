class Lazy {
  constructor(iterable) {
    this.iterable = iterable;
  }
  static range(start = 0, end = Infinity) {
    return new Lazy((function* () { for (let i = start; i < end; i++) yield i; })());
  }
  map(fn) {
    const src = this.iterable;
    return new Lazy((function* () { for (const x of src) yield fn(x); })());
  }
  filter(fn) {
    const src = this.iterable;
    return new Lazy((function* () { for (const x of src) if (fn(x)) yield x; })());
  }
  take(n) {
    const src = this.iterable;
    return new Lazy((function* () {
      if (n <= 0) return;
      let i = 0;
      for (const x of src) { yield x; if (++i >= n) return; }
    })());
  }
  toArray() { return [...this.iterable]; }
}

console.log(Lazy.range().filter((n) => n % 3 === 0).map((n) => n * n).take(5).toArray());
