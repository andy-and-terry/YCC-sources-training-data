type U = "a" | "b" | 1 | 2;
type S = Extract<U, string>;
type N = Exclude<U, string>;
const s: S = "a", n: N = 2;
console.log(s, n);
