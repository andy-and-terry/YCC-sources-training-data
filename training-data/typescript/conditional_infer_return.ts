type Unwrap<T> = T extends Promise<infer U> ? U : T;
type ElementOf<T> = T extends readonly (infer E)[] ? E : never;

type A = Unwrap<Promise<string>>; // string
type B = ElementOf<number[]>; // number

const a: A = "ok";
const b: B = 1;
console.log(a, b);
