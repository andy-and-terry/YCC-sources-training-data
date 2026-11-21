// Disarium numbers: digits raised to their 1-based positions sum to n.
const isDisarium = (n) =>
  String(n).split("").reduce((acc, c, i) => acc + Number(c) ** (i + 1), 0) === n;
const out = [];
for (let n = 1; n < 1000; n++) if (isDisarium(n)) out.push(n);
console.log(out.join(" "));
