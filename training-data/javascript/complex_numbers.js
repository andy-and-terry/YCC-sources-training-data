class Complex {
  constructor(re, im = 0) { this.re = re; this.im = im; }
  static polar(r, theta) { return new Complex(r * Math.cos(theta), r * Math.sin(theta)); }
  add(o) { return new Complex(this.re + o.re, this.im + o.im); }
  mul(o) { return new Complex(this.re * o.re - this.im * o.im, this.re * o.im + this.im * o.re); }
  conj() { return new Complex(this.re, -this.im); }
  abs() { return Math.hypot(this.re, this.im); }
  arg() { return Math.atan2(this.im, this.re); }
  div(o) {
    const d = o.re ** 2 + o.im ** 2;
    const n = this.mul(o.conj());
    return new Complex(n.re / d, n.im / d);
  }
  pow(k) { return Complex.polar(this.abs() ** k, this.arg() * k); }
  toString() {
    const s = this.im >= 0 ? "+" : "-";
    return `(${this.re.toFixed(3)} ${s} ${Math.abs(this.im).toFixed(3)}i)`;
  }
}

const a = new Complex(3, 4), b = new Complex(1, -2);
console.log(`${a.add(b)} ${a.mul(b)} ${a.div(b)} |a|=${a.abs()}`);
console.log(`e^(i*pi) = ${Complex.polar(1, Math.PI)}  a^2 = ${a.pow(2)}`);
module.exports = { Complex };
