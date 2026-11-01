function assertString(v: unknown): asserts v is string {
  if (typeof v !== "string") throw new TypeError("expected string");
}

function isNonEmpty<T>(a: T[]): a is [T, ...T[]] {
  return a.length > 0;
}

const input: unknown = "hello";
assertString(input);
console.log(input.length);

const xs = [3, 4];
if (isNonEmpty(xs)) console.log(xs[0]);
