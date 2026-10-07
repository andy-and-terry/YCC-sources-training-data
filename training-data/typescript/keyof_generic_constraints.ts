function getProp<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

function pick<T, K extends keyof T>(obj: T, keys: K[]): Pick<T, K> {
  const out = {} as Pick<T, K>;
  for (const k of keys) out[k] = obj[k];
  return out;
}

function sortBy<T, K extends keyof T>(items: T[], key: K): T[] {
  return [...items].sort((a, b) => (a[key] < b[key] ? -1 : a[key] > b[key] ? 1 : 0));
}

function longest<T extends { length: number }>(a: T, b: T): T {
  return a.length >= b.length ? a : b;
}

interface Person {
  name: string;
  age: number;
  email: string;
}

const people: Person[] = [
  { name: "Zed", age: 31, email: "z@x.io" },
  { name: "Amy", age: 27, email: "a@x.io" },
];

console.log(getProp(people[0], "name"));
console.log(pick(people[1], ["name", "age"]));
console.log(sortBy(people, "age").map((p) => p.name));
console.log(longest("hello", "hi"), longest([1, 2, 3], [1]));
