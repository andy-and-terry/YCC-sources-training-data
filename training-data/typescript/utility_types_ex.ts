interface User { id: number; name: string; email?: string; role: "admin" | "user" }

type Draft = Partial<User>;
type Required2 = Required<Pick<User, "id" | "email">>;
type Public = Omit<User, "role">;
type RoleMap = Record<User["role"], number>;

const d: Draft = { name: "x" };
const r: RoleMap = { admin: 1, user: 5 };
const p: Public = { id: 1, name: "ann" };
const q: Required2 = { id: 2, email: "a@b.c" };
console.log(d, r, p, q);
