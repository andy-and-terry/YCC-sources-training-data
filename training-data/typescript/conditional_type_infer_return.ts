// Conditional types with `infer` extract pieces of other types.
type Unwrap<T> = T extends Promise<infer U> ? U : T;
type ElementOf<T> = T extends readonly (infer E)[] ? E : never;
type ReturnOf<F> = F extends (...args: any[]) => infer R ? R : never;

type A = Unwrap<Promise<string>>;      // string
type B = ElementOf<number[]>;          // number
type C = ReturnOf<() => boolean>;      // boolean

const a: A = "ok";
const b: B = 3;
const c: C = true;
console.log(a, b, c);
