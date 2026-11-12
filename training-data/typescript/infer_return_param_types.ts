function make(a: number, b: string) { return { a, b }; }
type R = ReturnType<typeof make>;
type P = Parameters<typeof make>;
const r: R = { a: 1, b: "x" };
const p: P = [2, "y"];
console.log(r, make(...p));
