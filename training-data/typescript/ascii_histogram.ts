export function histogram<T extends string | number>(values: readonly T[], width = 30): string {
  const counts = new Map<T, number>();
  values.forEach((v) => counts.set(v, (counts.get(v) ?? 0) + 1));
  const peak = Math.max(...counts.values());
  return [...counts.entries()]
    .sort(([a], [b]) => (a < b ? -1 : 1))
    .map(([k, n]) => `${String(k).padStart(4)} | ${"*".repeat(Math.ceil((n / peak) * width))} ${n}`)
    .join("\n");
}

console.log(histogram([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]));
