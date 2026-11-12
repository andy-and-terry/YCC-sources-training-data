interface User { id: number; name: string; email?: string }
type Draft = Partial<User>;
type Required2 = Required<User>;
type Pub = Pick<User, "id" | "name">;
type NoId = Omit<User, "id">;
const d: Draft = {};
const p: Pub = { id: 1, name: "a" };
const n: NoId = { name: "b" };
console.log(d, p, n);
