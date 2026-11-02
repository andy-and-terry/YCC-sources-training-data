type Mutable<T> = { -readonly [K in keyof T]: T[K] };
interface Frozen { readonly a: number; readonly b: string }
const m: Mutable<Frozen> = { a: 1, b: "x" };
m.a = 2;
console.log(m);
