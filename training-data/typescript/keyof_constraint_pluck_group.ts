function pluck<T, K extends keyof T>(items: T[], key: K): T[K][] {
  return items.map((i) => i[key]);
}

function groupBy<T, K extends string | number>(items: T[], fn: (t: T) => K): Record<K, T[]> {
  const out = {} as Record<K, T[]>;
  for (const it of items) {
    (out[fn(it)] ??= []).push(it);
  }
  return out;
}

const people = [
  { name: "Ann", age: 30 },
  { name: "Bob", age: 25 },
  { name: "Cy", age: 30 },
];
console.log(pluck(people, "name"));
console.log(groupBy(people, (p) => p.age));
