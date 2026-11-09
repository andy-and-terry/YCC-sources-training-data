function assertString(x: unknown): asserts x is string {
  if (typeof x !== "string") throw new TypeError("not a string");
}
const v: unknown = "hello";
assertString(v);
console.log(v.toUpperCase());
