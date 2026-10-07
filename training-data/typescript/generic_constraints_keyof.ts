function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

function pick<T, K extends keyof T>(obj: T, ...keys: K[]): Pick<T, K> {
  const result = {} as Pick<T, K>;
  for (const key of keys) {
    result[key] = obj[key];
  }
  return result;
}

function sortBy<T, K extends keyof T>(items: T[], key: K): T[] {
  return [...items].sort((a, b) => (a[key] < b[key] ? -1 : a[key] > b[key] ? 1 : 0));
}

interface HasLength {
  length: number;
}

function longest<T extends HasLength>(a: T, b: T): T {
  return a.length >= b.length ? a : b;
}

const user = { id: 7, name: "Ada", active: true };
console.log(getProperty(user, "name"));
console.log(pick(user, "id", "active"));
console.log(sortBy([{ n: 3 }, { n: 1 }, { n: 2 }], "n"));
console.log(longest("hello", "hi"), longest([1, 2, 3], [1]));
