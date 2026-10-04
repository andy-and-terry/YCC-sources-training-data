function assert(condition: unknown, msg: string): asserts condition {
  if (!condition) throw new Error(msg);
}

function assertIsString(value: unknown): asserts value is string {
  if (typeof value !== "string") {
    throw new TypeError(`expected string, got ${typeof value}`);
  }
}

function shout(input: unknown): string {
  assertIsString(input);
  return input.toUpperCase(); // narrowed to string here
}

function firstItem(items: number[]): number {
  const first = items[0];
  assert(first !== undefined, "list is empty");
  return first;
}

console.log(shout("quiet"));
console.log(firstItem([7, 8]));
for (const f of [() => shout(42), () => firstItem([])]) {
  try {
    f();
  } catch (e) {
    console.log((e as Error).message);
  }
}
