function getProp<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

function pluck<T, K extends keyof T>(items: T[], key: K): T[K][] {
  return items.map((item) => item[key]);
}

function longest<T extends { length: number }>(a: T, b: T): T {
  return a.length >= b.length ? a : b;
}

interface User {
  id: number;
  name: string;
  active: boolean;
}

const users: User[] = [
  { id: 1, name: "Ada", active: true },
  { id: 2, name: "Linus", active: false },
];

console.log(getProp(users[0], "name"));
console.log(pluck(users, "id"));
console.log(longest("hello", "hi"));
console.log(longest([1, 2, 3], [4, 5]));
