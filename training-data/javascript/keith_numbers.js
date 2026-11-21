// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
function isKeith(n) {
  const seq = String(n).split("").map(Number);
  const k = seq.length;
  while (seq[seq.length - 1] < n) {
    seq.push(seq.slice(-k).reduce((a, b) => a + b, 0));
  }
  return seq[seq.length - 1] === n;
}
const out = [];
for (let n = 10; n < 1200; n++) if (isKeith(n)) out.push(n);
console.log(out.join(" "));
