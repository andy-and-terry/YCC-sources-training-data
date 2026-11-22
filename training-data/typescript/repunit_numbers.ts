// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1 using bigint.
let r: bigint = 0n;
const out: string[] = [];
for (let i = 0; i < 8; i++) {
  r = r * 10n + 1n;
  out.push(r.toString());
}
console.log(out.join(" "));
