interface HasLength {
  length: number;
}

function longest<T extends HasLength>(a: T, b: T): T {
  return a.length >= b.length ? a : b;
}

function getProp<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

function pick<T, K extends keyof T>(obj: T, keys: K[]): Pick<T, K> {
  const out = {} as Pick<T, K>;
  for (const k of keys) out[k] = obj[k];
  return out;
}

function createInstance<T>(ctor: new (...args: any[]) => T, ...args: any[]): T {
  return new ctor(...args);
}

class Point {
  constructor(public x: number, public y: number) {}
}

console.log(longest("abc", "de"));
console.log(longest([1, 2], [3, 4, 5]));

const user = { id: 1, name: "Ada", admin: true };
console.log(getProp(user, "name"));
console.log(pick(user, ["id", "admin"]));
console.log(createInstance(Point, 3, 4));
