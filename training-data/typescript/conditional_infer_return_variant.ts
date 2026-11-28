type Unwrap<T> = T extends Promise<infer U> ? U : T;
type ElementOf<T> = T extends (infer E)[] ? E : never;

type A = Unwrap<Promise<string>>;
type B = ElementOf<number[]>;

const a: A = "ok";
const b: B = 1;
console.log(a, b);
