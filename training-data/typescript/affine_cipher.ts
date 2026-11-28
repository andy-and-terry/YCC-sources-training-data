function modInverse(a: number, m: number): number {
  for (let x = 1; x < m; x++) if ((a * x) % m === 1) return x;
  throw new Error("no inverse");
}
function affine(text: string, a: number, b: number, decrypt = false): string {
  const inv = modInverse(a, 26);
  return text
    .toUpperCase()
    .replace(/[A-Z]/g, (ch) => {
      const x = ch.charCodeAt(0) - 65;
      const y = decrypt ? (((inv * (x - b)) % 26) + 26) % 26 : (a * x + b) % 26;
      return String.fromCharCode(y + 65);
    });
}
const c = affine("AFFINE", 5, 8);
console.log(c, affine(c, 5, 8, true));
