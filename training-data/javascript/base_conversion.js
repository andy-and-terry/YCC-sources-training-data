const DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz";

function toBase(n, base) {
  if (base < 2 || base > 36) throw new RangeError("base out of range");
  if (n === 0) return "0";
  const sign = n < 0 ? "-" : "";
  n = Math.abs(n);
  let out = "";
  while (n > 0) {
    out = DIGITS[n % base] + out;
    n = Math.floor(n / base);
  }
  return sign + out;
}

function fromBase(s, base) {
  const neg = s.startsWith("-");
  let v = 0;
  for (const ch of s.toLowerCase().replace("-", "")) v = v * base + DIGITS.indexOf(ch);
  return neg ? -v : v;
}

for (const [n, b] of [[255, 2], [255, 16], [-1295, 36], [0, 7]]) {
  const s = toBase(n, b);
  console.log(n, "base", b, "=", s, fromBase(s, b) === n ? "ok" : "MISMATCH");
}
module.exports = { toBase, fromBase };
