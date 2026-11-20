// Aliquot sum with a string-literal union result.
type Kind = "perfect" | "abundant" | "deficient";
function classify(n: number): Kind {
  let s = 0;
  for (let d = 1; d < n; d++) if (n % d === 0) s += d;
  return s === n ? "perfect" : s > n ? "abundant" : "deficient";
}
for (const n of [6, 12, 15, 28]) console.log(n, classify(n));
