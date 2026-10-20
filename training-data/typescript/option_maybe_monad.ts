class Maybe<T> {
  private constructor(private v: T | null) {}
  static of<T>(v: T | null) { return new Maybe(v); }
  map<U>(f: (t: T) => U) { return this.v === null ? new Maybe<U>(null) : new Maybe(f(this.v)); }
  getOrElse(d: T) { return this.v ?? d; }
}
console.log(Maybe.of(4).map((n) => n * 2).getOrElse(0), Maybe.of<number>(null).map((n) => n + 1).getOrElse(-1));
