export class Polynomial {
  readonly coeffs: readonly number[];

  constructor(coeffs: readonly number[]) {
    const c = [...coeffs];
    while (c.length > 1 && c[c.length - 1] === 0) c.pop();
    this.coeffs = c.length ? c : [0];
  }

  get degree(): number {
    return this.coeffs.length - 1;
  }

  add(o: Polynomial): Polynomial {
    const n = Math.max(this.coeffs.length, o.coeffs.length);
    return new Polynomial(Array.from({ length: n }, (_, i) => (this.coeffs[i] ?? 0) + (o.coeffs[i] ?? 0)));
  }

  mul(o: Polynomial): Polynomial {
    const out = new Array<number>(this.coeffs.length + o.coeffs.length - 1).fill(0);
    this.coeffs.forEach((a, i) => o.coeffs.forEach((b, j) => (out[i + j] += a * b)));
    return new Polynomial(out);
  }

  /** Long division: returns [quotient, remainder]. */
  divmod(d: Polynomial): [Polynomial, Polynomial] {
    const r = [...this.coeffs];
    const q = new Array<number>(Math.max(0, this.degree - d.degree + 1)).fill(0);
    for (let i = this.degree - d.degree; i >= 0; i--) {
      const f = r[i + d.degree] / d.coeffs[d.degree];
      q[i] = f;
      d.coeffs.forEach((c, j) => (r[i + j] -= f * c));
    }
    return [new Polynomial(q), new Polynomial(r.slice(0, Math.max(1, d.degree)))];
  }

  evaluate(x: number): number {
    return this.coeffs.reduceRight((acc, c) => acc * x + c, 0);
  }

  toString(): string {
    return this.coeffs
      .map((c, i) => (c === 0 ? "" : i === 0 ? `${c}` : `${c === 1 ? "" : c}x${i > 1 ? `^${i}` : ""}`))
      .filter(Boolean)
      .reverse()
      .join(" + ") || "0";
  }
}

const p = new Polynomial([-1, 0, 0, 1]); // x^3 - 1
const [q, r] = p.divmod(new Polynomial([-1, 1])); // / (x - 1)
console.log(`(${p}) / (x - 1) = ${q} rem ${r}`);
console.log(`${new Polynomial([1, 1]).mul(new Polynomial([1, 1]))}`, p.evaluate(2));
