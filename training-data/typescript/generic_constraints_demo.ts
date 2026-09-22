interface HasId {
  id: number;
}

function findById<T extends HasId>(items: T[], id: number): T | undefined {
  return items.find((item) => item.id === id);
}

function pluck<T, K extends keyof T>(items: T[], key: K): T[K][] {
  return items.map((item) => item[key]);
}

interface User extends HasId {
  name: string;
  age: number;
}

const users: User[] = [
  { id: 1, name: "Ada", age: 36 },
  { id: 2, name: "Bob", age: 29 },
];

console.log(findById(users, 2));
console.log(pluck(users, "name"));
console.log(pluck(users, "age"));
