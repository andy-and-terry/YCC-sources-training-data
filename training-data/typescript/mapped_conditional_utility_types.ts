type Readonly2<T> = { readonly [K in keyof T]: T[K] };
type Nullable<T> = { [K in keyof T]: T[K] | null };
type ElementOf<T> = T extends (infer U)[] ? U : never;

interface User { id: number; name: string }
const u: Readonly2<User> = { id: 1, name: "ann" };
const n: Nullable<User> = { id: null, name: "x" };
const e: ElementOf<string[]> = "ok";
console.log(u, n, e);
