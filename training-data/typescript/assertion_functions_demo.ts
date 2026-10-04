function assert(condition: unknown, message: string): asserts condition {
  if (!condition) throw new Error(message);
}

function assertIsString(value: unknown): asserts value is string {
  if (typeof value !== "string") {
    throw new TypeError(`expected string, got ${typeof value}`);
  }
}

function assertNonNull<T>(value: T, name: string): asserts value is NonNullable<T> {
  if (value === null || value === undefined) {
    throw new Error(`${name} must not be null`);
  }
}

function shout(input: unknown): string {
  assertIsString(input);
  return input.toUpperCase(); // narrowed to string here
}

function firstChar(maybe: string | null | undefined): string {
  assertNonNull(maybe, "maybe");
  return maybe[0] ?? "";
}

function divide(a: number, b: number): number {
  assert(b !== 0, "division by zero");
  return a / b;
}

console.log(shout("hello"));
console.log(firstChar("world"));
console.log(divide(10, 4));

for (const attempt of [() => shout(42), () => firstChar(null), () => divide(1, 0)]) {
  try {
    attempt();
  } catch (e) {
    console.log((e as Error).name + ": " + (e as Error).message);
  }
}
