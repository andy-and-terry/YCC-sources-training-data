function modInverse(a, m) {
  for (let x = 1; x < m; x++) if ((a * x) % m === 1) return x;
  return null;
}
function affine(text, a, b, decrypt = false) {
  const inv = modInverse(a, 26);
  return [...text.toUpperCase()]
    .map((ch) => {
      if (!/[A-Z]/.test(ch)) return ch;
      const x = ch.charCodeAt(0) - 65;
      const y = decrypt ? (((inv * (x - b)) % 26) + 26) % 26 : (a * x + b) % 26;
      return String.fromCharCode(y + 65);
    })
    .join("");
}
const c = affine("AFFINE", 5, 8);
console.log(c, affine(c, 5, 8, true));
