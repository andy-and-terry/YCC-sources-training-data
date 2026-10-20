class Observable {
  constructor(subscribe) { this._s = subscribe; }
  subscribe(next) { return this._s({ next }); }
  map(fn) { return new Observable((o) => this._s({ next: (v) => o.next(fn(v)) })); }
  filter(fn) { return new Observable((o) => this._s({ next: (v) => fn(v) && o.next(v) })); }
}
new Observable((o) => { [1, 2, 3, 4].forEach(o.next); })
  .filter((x) => x % 2 === 0).map((x) => x * 10).subscribe(console.log);
