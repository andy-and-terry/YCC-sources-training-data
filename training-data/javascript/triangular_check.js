// n is triangular iff 8n + 1 is a perfect square.
function isTriangular(n) {
  const s = 8 * n + 1;
  const r = Math.round(Math.sqrt(s));
  return r * r === s;
}
const out = [];
for (let n = 0; n <= 20; n++) if (isTriangular(n)) out.push(n);
console.log(out.join(" "));
