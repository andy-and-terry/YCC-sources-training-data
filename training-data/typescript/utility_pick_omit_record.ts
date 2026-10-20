interface User { id: number; name: string; email: string }
type Public = Omit<User, "email">;
type Summary = Pick<User, "id" | "name">;
const idx: Record<number, Summary> = { 1: { id: 1, name: "a" } };
const p: Public = { id: 1, name: "a" };
console.log(idx, p);
