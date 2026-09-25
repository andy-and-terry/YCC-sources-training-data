class Poly {
  constructor(coeffs) {
    const c = [...coeffs];
    while (c.length > 1 && c.at(-1) === 0) c.pop();
    this.c = c.length ? c : [0];
  }
  add(o) {
    const n = Math.max(this.c.length, o.c.length);
    return new Poly(Array.from({ length: n }, (_, i) => (this.c[i] ?? 0) + (o.c[i] ?? 0)));
  }
  mul(o) {
    const out = new Array(this.c.length + o.c.length - 1).fill(0);
    this.c.forEach((a, i) => o.c.forEach((b, j) => (out[i + j] += a * b)));
    return new Poly(out);
  }
  eval(x) {
    return this.c.reduceRight((acc, coef) => acc * x + coef, 0);
  }
  derivative() {
    return new Poly(this.c.slice(1).map((c, i) => c * (i + 1)));
  }
  toString() {
    const terms = [];
    for (let i = this.c.length - 1; i >= 0; i--) {
      const c = this.c[i];
      if (!c) continue;
      terms.push(i === 0 ? `${c}` : `${c === 1 ? "" : c}x${i > 1 ? "^" + i : ""}`);
    }
    return terms.join(" + ") || "0";
  }
}

const p = new Poly([1, 1]), q = new Poly([-1, 1]);
const cube = p.mul(p).mul(p);
console.log(`${p.mul(q)} | ${cube} | ${cube.derivative()} | p(2)=${new Poly([1, 2, 3]).eval(2)}`);
module.exports = { Poly };
