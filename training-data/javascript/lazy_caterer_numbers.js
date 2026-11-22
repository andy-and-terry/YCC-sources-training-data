// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
const out = [];
for (let n = 0; n < 10; n++) out.push((n * (n + 1)) / 2 + 1);
console.log(out.join(" "));
