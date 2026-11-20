// Aliquot sum and perfect/abundant/deficient classification.
function aliquot(n) { let s = 0; for (let d = 1; d < n; d++) if (n % d === 0) s += d; return s; }
for (const n of [6, 12, 15, 28]) {
  const a = aliquot(n);
  console.log(n, a, a === n ? "perfect" : a > n ? "abundant" : "deficient");
}
