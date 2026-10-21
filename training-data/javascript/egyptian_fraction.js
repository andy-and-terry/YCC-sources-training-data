// Greedy Egyptian fraction using BigInt to avoid overflow.
function egyptian(num, den) {
  const out = [];
  while (num !== 0n) {
    const d = (den + num - 1n) / num;
    out.push(d);
    num = num * d - den;
    den *= d;
  }
  return out;
}

console.log(egyptian(4n, 13n).map((d) => `1/${d}`).join(" + "));
