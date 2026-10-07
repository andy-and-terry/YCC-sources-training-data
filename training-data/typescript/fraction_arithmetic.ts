const gcd = (a: bigint, b: bigint): bigint => {
  while (b) [a, b] = [b, a % b];
  return a < 0n ? -a : a;
};

export class Fraction {
  readonly n: bigint;
  readonly d: bigint;

  constructor(n: bigint | number, d: bigint | number = 1n) {
    let nn = BigInt(n), dd = BigInt(d);
    if (dd === 0n) throw new RangeError("zero denominator");
    if (dd < 0n) { nn = -nn; dd = -dd; }
    const g = gcd(nn, dd) || 1n;
    this.n = nn / g;
    this.d = dd / g;
  }

  add(o: Fraction): Fraction { return new Fraction(this.n * o.d + o.n * this.d, this.d * o.d); }
  sub(o: Fraction): Fraction { return new Fraction(this.n * o.d - o.n * this.d, this.d * o.d); }
  mul(o: Fraction): Fraction { return new Fraction(this.n * o.n, this.d * o.d); }
  div(o: Fraction): Fraction { return new Fraction(this.n * o.d, this.d * o.n); }
  compare(o: Fraction): number {
    const diff = this.n * o.d - o.n * this.d;
    return diff === 0n ? 0 : diff < 0n ? -1 : 1;
  }
  toString(): string { return this.d === 1n ? `${this.n}` : `${this.n}/${this.d}`; }
}

const a = new Fraction(1, 3), b = new Fraction(1, 6);
console.log(`${a.add(b)} ${a.sub(b)} ${a.mul(b)} ${a.div(b)} cmp=${a.compare(b)}`);
let h = new Fraction(0);
for (let k = 1; k <= 10; k++) h = h.add(new Fraction(1, k));
console.log(`H(10) = ${h}`);
