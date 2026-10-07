function groupBy<T, K extends PropertyKey>(items: readonly T[], key: (item: T) => K): Record<K, T[]> {
  return items.reduce((acc, item) => {
    const k = key(item);
    (acc[k] ??= []).push(item);
    return acc;
  }, {} as Record<K, T[]>);
}

function countBy<T>(items: readonly T[], key: (item: T) => string): Map<string, number> {
  const m = new Map<string, number>();
  for (const it of items) m.set(key(it), (m.get(key(it)) ?? 0) + 1);
  return m;
}

const people = [
  { name: "Ann", age: 31 },
  { name: "Bo", age: 25 },
  { name: "Cy", age: 31 },
];
console.log(groupBy(people, (p) => p.age));
console.log(countBy(people, (p) => (p.age > 30 ? "30+" : "under")));
