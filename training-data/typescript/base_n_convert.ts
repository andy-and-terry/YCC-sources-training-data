const DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz";

function toBase(n: number, base: number): string {
  if (base < 2 || base > 36) throw new RangeError("base must be 2..36");
  if (n === 0) return "0";
  const sign = n < 0 ? "-" : "";
  let m = Math.abs(n);
  let out = "";
  while (m > 0) {
    out = DIGITS[m % base] + out;
    m = Math.floor(m / base);
  }
  return sign + out;
}

console.log(toBase(255, 2), toBase(255, 16), toBase(-1295, 36));
