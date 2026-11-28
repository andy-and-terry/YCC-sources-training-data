function railOrder(n: number, k: number): number[] {
  const pat: number[] = [];
  for (let i = 0; i < k; i++) pat.push(i);
  for (let i = k - 2; i > 0; i--) pat.push(i);
  const rail = (i: number) => pat[i % pat.length];
  return Array.from({ length: n }, (_, i) => i).sort((a, b) => rail(a) - rail(b) || a - b);
}
const encrypt = (t: string, k: number): string =>
  railOrder(t.length, k).map((i) => t[i]).join("");
function decrypt(c: string, k: number): string {
  const out: string[] = [];
  railOrder(c.length, k).forEach((i, pos) => (out[i] = c[pos]));
  return out.join("");
}
const c = encrypt("WEAREDISCOVERED", 3);
console.log(c, decrypt(c, 3));
