export function intersection<T>(...arrays: readonly T[][]): T[] {
  if (arrays.length === 0) return [];
  const [first, ...rest] = arrays;
  const sets = rest.map((a) => new Set(a));
  return [...new Set(first)].filter((x) => sets.every((s) => s.has(x)));
}

export function multisetIntersection<T>(a: readonly T[], b: readonly T[]): T[] {
  const counts = new Map<T, number>();
  for (const x of a) counts.set(x, (counts.get(x) ?? 0) + 1);
  return b.filter((x) => {
    const c = counts.get(x) ?? 0;
    if (c > 0) counts.set(x, c - 1);
    return c > 0;
  });
}

console.log(intersection([4, 9, 5, 4], [9, 4, 9, 8, 4], [4, 9, 1]));
console.log(multisetIntersection([4, 9, 5, 4, 4], [9, 4, 9, 8, 4]));
