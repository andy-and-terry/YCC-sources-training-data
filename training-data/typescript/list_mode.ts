function modes<T>(items: T[]): T[] {
  const counts = new Map<T, number>();
  for (const x of items) counts.set(x, (counts.get(x) ?? 0) + 1);
  const top = Math.max(...counts.values());
  return [...counts].filter(([, c]) => c === top).map(([k]) => k);
}

console.log(modes(["a", "b", "b", "c", "c"]));
