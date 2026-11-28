function cosine(a, b) {
  const dot = a.reduce((s, x, i) => s + x * b[i], 0);
  const norm = (v) => Math.sqrt(v.reduce((s, x) => s + x * x, 0));
  const d = norm(a) * norm(b);
  return d === 0 ? 0 : dot / d;
}
console.log(cosine([1, 2, 3], [4, 5, 6]).toFixed(4));
console.log(cosine([1, 0], [0, 1]));
