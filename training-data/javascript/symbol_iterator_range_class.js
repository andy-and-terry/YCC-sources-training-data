class Range {
  constructor(a, b) { this.a = a; this.b = b; }
  *[Symbol.iterator]() { for (let i = this.a; i <= this.b; i++) yield i; }
}
console.log([...new Range(1, 5)]);
console.log(Math.max(...new Range(3, 9)));
