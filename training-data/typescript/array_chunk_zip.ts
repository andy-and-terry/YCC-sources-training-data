function chunk<T>(arr: readonly T[], size: number): T[][] {
  if (size <= 0) throw new Error("size must be positive");
  const out: T[][] = [];
  for (let i = 0; i < arr.length; i += size) out.push(arr.slice(i, i + size));
  return out;
}

function zip<A, B>(a: readonly A[], b: readonly B[]): [A, B][] {
  return Array.from({ length: Math.min(a.length, b.length) }, (_, i) => [a[i], b[i]] as [A, B]);
}

function unzip<A, B>(pairs: readonly [A, B][]): [A[], B[]] {
  return [pairs.map((p) => p[0]), pairs.map((p) => p[1])];
}

console.log(chunk([1, 2, 3, 4, 5], 2));
const z = zip(["a", "b", "c"], [1, 2]);
console.log(z, unzip(z));
