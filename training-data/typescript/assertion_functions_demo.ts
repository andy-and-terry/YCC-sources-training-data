function assertIsString(value: unknown): asserts value is string {
  if (typeof value !== "string") {
    throw new TypeError(`expected string, got ${typeof value}`);
  }
}

function assert(condition: unknown, message: string): asserts condition {
  if (!condition) throw new Error(message);
}

function shout(input: unknown): string {
  assertIsString(input);
  return input.toUpperCase(); // input is narrowed to string here
}

function firstItem(items: string[]): string {
  const item = items[0] as string | undefined;
  assert(item !== undefined, "list must not be empty");
  return item;
}

console.log(shout("hello"));
console.log(firstItem(["a", "b"]));

try {
  shout(42);
} catch (e) {
  console.log((e as Error).message);
}
