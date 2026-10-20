// Assertion functions narrow the type for the rest of the scope when they return.
function assertIsString(value: unknown): asserts value is string {
  if (typeof value !== "string") {
    throw new TypeError(`expected string, got ${typeof value}`);
  }
}

function shout(input: unknown): string {
  assertIsString(input);
  return input.toUpperCase();
}

console.log(shout("hello"));
try {
  shout(42);
} catch (e) {
  console.log((e as Error).message);
}
