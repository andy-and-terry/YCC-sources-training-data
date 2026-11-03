function modes(items) {
  const counts = new Map();
  for (const x of items) counts.set(x, (counts.get(x) ?? 0) + 1);
  const top = Math.max(...counts.values());
  return [...counts].filter(([, c]) => c === top).map(([k]) => k).sort((a, b) => a - b);
}

console.log(modes([1, 2, 2, 3, 3, 4]));
