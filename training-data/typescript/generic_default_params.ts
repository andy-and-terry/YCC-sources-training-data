interface Box<T = string> { v: T }
const a: Box = { v: "s" };
const b: Box<number> = { v: 1 };
console.log(a, b);
