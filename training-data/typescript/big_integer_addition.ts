/** Arbitrary-precision non-negative integers stored as base-1e7 limbs (little-endian). */
export class BigNat {
  private static readonly BASE = 10_000_000;
  private constructor(private readonly limbs: number[]) {}

  static parse(s: string): BigNat {
    const limbs: number[] = [];
    for (let end = s.length; end > 0; end -= 7) limbs.push(Number(s.slice(Math.max(0, end - 7), end)));
    return new BigNat(limbs);
  }

  add(o: BigNat): BigNat {
    const out: number[] = [];
    let carry = 0;
    for (let i = 0; i < Math.max(this.limbs.length, o.limbs.length) || carry; i++) {
      const s = (this.limbs[i] ?? 0) + (o.limbs[i] ?? 0) + carry;
      out.push(s % BigNat.BASE);
      carry = Math.floor(s / BigNat.BASE);
    }
    return new BigNat(out);
  }

  mulSmall(k: number): BigNat {
    const out: number[] = [];
    let carry = 0;
    for (let i = 0; i < this.limbs.length || carry; i++) {
      const p = (this.limbs[i] ?? 0) * k + carry;
      out.push(p % BigNat.BASE);
      carry = Math.floor(p / BigNat.BASE);
    }
    return new BigNat(out);
  }

  toString(): string {
    const top = this.limbs.length - 1;
    return this.limbs
      .map((l, i) => (i === top ? String(l) : String(l).padStart(7, "0")))
      .reverse()
      .join("");
  }
}

console.log(BigNat.parse("99999999999999999999").add(BigNat.parse("1")).toString());
let f = BigNat.parse("1");
for (let i = 2; i <= 30; i++) f = f.mulSmall(i);
console.log("30! =", f.toString(), f.toString() === (265252859812191058636308480000000n).toString());
