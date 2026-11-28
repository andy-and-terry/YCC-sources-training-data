function jaccard<T>(a: Iterable<T>, b: Iterable<T>): number {
  const A = new Set(a);
  const B = new Set(b);
  let inter = 0;
  for (const x of A) if (B.has(x)) inter++;
  const union = A.size + B.size - inter;
  return union === 0 ? 1 : inter / union;
}
console.log(jaccard([1, 2, 3, 4], [3, 4, 5]));
