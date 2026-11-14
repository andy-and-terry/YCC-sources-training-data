function assertString(v: unknown): asserts v is string {
  if (typeof v !== "string") throw new TypeError("not a string");
}

function shout(v: unknown) {
  assertString(v);
  return v.toUpperCase();
}

console.log(shout("hi"));
