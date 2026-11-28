function railIndex(n, k) {
  const pat = [];
  for (let i = 0; i < k; i++) pat.push(i);
  for (let i = k - 2; i > 0; i--) pat.push(i);
  return Array.from({ length: n }, (_, i) => pat[i % pat.length]);
}
function order(n, k) {
  const r = railIndex(n, k);
  return [...r.keys()].sort((a, b) => r[a] - r[b] || a - b);
}
const encrypt = (t, k) => order(t.length, k).map((i) => t[i]).join("");
function decrypt(c, k) {
  const out = [];
  order(c.length, k).forEach((i, pos) => (out[i] = c[pos]));
  return out.join("");
}
const c = encrypt("WEAREDISCOVERED", 3);
console.log(c, decrypt(c, 3));
