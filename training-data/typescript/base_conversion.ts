const DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz";

export function toBase(n: bigint, base: number): string {
  if (base < 2 || base > 36) throw new RangeError("base out of range");
  if (n === 0n) return "0";
  const neg = n < 0n;
  if (neg) n = -n;
  const b = BigInt(base);
  let out = "";
  while (n > 0n) {
    out = DIGITS[Number(n % b)] + out;
    n /= b;
  }
  return (neg ? "-" : "") + out;
}

export function fromBase(s: string, base: number): bigint {
  const neg = s.startsWith("-");
  let v = 0n;
  for (const ch of s.toLowerCase().replace(/^-/, "")) {
    const d = DIGITS.indexOf(ch);
    if (d < 0 || d >= base) throw new SyntaxError(`bad digit '${ch}' for base ${base}`);
    v = v * BigInt(base) + BigInt(d);
  }
  return neg ? -v : v;
}

for (const [n, b] of [[255n, 2], [255n, 16], [-1295n, 36], [2n ** 64n, 36]] as const) {
  const s = toBase(n, b);
  console.log(`${n} base ${b} = ${s}`, fromBase(s, b) === n ? "ok" : "MISMATCH");
}
