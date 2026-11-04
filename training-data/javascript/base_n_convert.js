function toBase(n, base) {
  return n.toString(base);
}

function fromBase(s, base) {
  let value = 0;
  for (const ch of s.toLowerCase()) {
    const d = parseInt(ch, 36);
    if (Number.isNaN(d) || d >= base) throw new RangeError(`bad digit ${ch}`);
    value = value * base + d;
  }
  return value;
}

console.log(toBase(255, 2), toBase(255, 16), toBase(1295, 36));
console.log(fromBase("zz", 36)); // 1295
