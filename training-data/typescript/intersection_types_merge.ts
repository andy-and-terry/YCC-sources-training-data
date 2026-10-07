interface Named {
  name: string;
}

interface Aged {
  age: number;
}

type Person = Named & Aged;

function merge<A extends object, B extends object>(a: A, b: B): A & B {
  return { ...a, ...b };
}

const person: Person = { name: "Eve", age: 28 };
const withEmail = merge(person, { email: "eve@example.com" });
console.log(withEmail.name, withEmail.email);

type Timestamped<T> = T & { createdAt: Date };

function stamp<T extends object>(value: T): Timestamped<T> {
  return { ...value, createdAt: new Date(0) };
}

const stamped = stamp({ id: 1 });
console.log(stamped.id, stamped.createdAt.toISOString());

type WithId = { id: number };
type WithLabel = { label: string };
type Item = WithId & WithLabel;
const items: Item[] = [
  { id: 1, label: "a" },
  { id: 2, label: "b" },
];
console.log(items.map((i) => `${i.id}:${i.label}`).join(","));

// intersections of conflicting primitives collapse to never
type Impossible = string & number;
const check: Impossible[] = [];
console.log(check.length);
