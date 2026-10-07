export class Complex {
  constructor(readonly re: number, readonly im = 0) {}
  static polar(r: number, theta: number): Complex {
    return new Complex(r * Math.cos(theta), r * Math.sin(theta));
  }
  add(o: Complex): Complex { return new Complex(this.re + o.re, this.im + o.im); }
  sub(o: Complex): Complex { return new Complex(this.re - o.re, this.im - o.im); }
  mul(o: Complex): Complex { return new Complex(this.re * o.re - this.im * o.im, this.re * o.im + this.im * o.re); }
  conj(): Complex { return new Complex(this.re, -this.im); }
  abs(): number { return Math.hypot(this.re, this.im); }
  div(o: Complex): Complex {
    const d = o.re ** 2 + o.im ** 2;
    const n = this.mul(o.conj());
    return new Complex(n.re / d, n.im / d);
  }
  toString(): string {
    return `(${this.re.toFixed(3)} ${this.im >= 0 ? "+" : "-"} ${Math.abs(this.im).toFixed(3)}i)`;
  }
}

/** Radix-2 FFT built on the Complex class. */
export function fft(xs: Complex[]): Complex[] {
  const n = xs.length;
  if (n === 1) return xs;
  const even = fft(xs.filter((_, i) => i % 2 === 0));
  const odd = fft(xs.filter((_, i) => i % 2 === 1));
  const out = new Array<Complex>(n);
  for (let k = 0; k < n / 2; k++) {
    const t = Complex.polar(1, (-2 * Math.PI * k) / n).mul(odd[k]);
    out[k] = even[k].add(t);
    out[k + n / 2] = even[k].sub(t);
  }
  return out;
}

const a = new Complex(3, 4), b = new Complex(1, -2);
console.log(`${a.add(b)} ${a.mul(b)} ${a.div(b)} |a|=${a.abs()}`);
console.log(fft([1, 1, 1, 1, 0, 0, 0, 0].map((v) => new Complex(v))).map(String).join(" "));
