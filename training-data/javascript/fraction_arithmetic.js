const gcd = (a, b) => (b === 0n ? (a < 0n ? -a : a) : gcd(b, a % b));

class Fraction {
  constructor(n, d = 1n) {
    n = BigInt(n);
    d = BigInt(d);
    if (d === 0n) throw new RangeError("zero denominator");
    if (d < 0n) { n = -n; d = -d; }
    const g = gcd(n, d) || 1n;
    this.n = n / g;
    this.d = d / g;
  }
  add(o) { return new Fraction(this.n * o.d + o.n * this.d, this.d * o.d); }
  sub(o) { return new Fraction(this.n * o.d - o.n * this.d, this.d * o.d); }
  mul(o) { return new Fraction(this.n * o.n, this.d * o.d); }
  div(o) { return new Fraction(this.n * o.d, this.d * o.n); }
  equals(o) { return this.n === o.n && this.d === o.d; }
  toString() { return this.d === 1n ? `${this.n}` : `${this.n}/${this.d}`; }
}

const a = new Fraction(1, 3), b = new Fraction(1, 6);
console.log(`${a.add(b)} ${a.sub(b)} ${a.mul(b)} ${a.div(b)}`);
let harmonic = new Fraction(0);
for (let k = 1; k <= 10; k++) harmonic = harmonic.add(new Fraction(1, k));
console.log("H(10) =", harmonic.toString());
module.exports = { Fraction };
