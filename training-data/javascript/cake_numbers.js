// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
const out = [];
for (let n = 0; n < 10; n++) out.push((n ** 3 + 5 * n + 6) / 6);
console.log(out.join(" "));
