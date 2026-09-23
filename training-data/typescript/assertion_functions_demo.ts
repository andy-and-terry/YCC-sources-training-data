interface User {
  name: string;
  age: number;
}

function assertIsUser(value: unknown): asserts value is User {
  if (
    typeof value !== "object" ||
    value === null ||
    typeof (value as User).name !== "string" ||
    typeof (value as User).age !== "number"
  ) {
    throw new Error("value is not a User");
  }
}

function assertDefined<T>(value: T | undefined, message: string): asserts value is T {
  if (value === undefined) {
    throw new Error(message);
  }
}

function greet(input: unknown): string {
  assertIsUser(input);
  // TypeScript now narrows `input` to `User` for the rest of this scope.
  return `Hello, ${input.name} (${input.age})`;
}

console.log(greet({ name: "Ada", age: 36 }));

let maybeCount: number | undefined = 5;
assertDefined(maybeCount, "maybeCount must be defined");
console.log(maybeCount + 1);

try {
  greet({ name: "no age" });
} catch (err) {
  console.log(`caught: ${(err as Error).message}`);
}
