type Unwrap<T> = T extends Promise<infer U> ? Unwrap<U> : T extends (infer E)[] ? E : T;

type A = Unwrap<Promise<Promise<string>>>;
type B = Unwrap<number[]>;
type C = Unwrap<boolean>;

const a: A = "text";
const b: B = 7;
const c: C = true;
console.log(a, b, c);
