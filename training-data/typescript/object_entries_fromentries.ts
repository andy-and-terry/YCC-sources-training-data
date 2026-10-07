const prices = { apple: 1.5, banana: 0.25, cherry: 4 };

const doubled = Object.fromEntries(
  Object.entries(prices).map(([name, price]) => [name, price * 2]),
);
console.log(doubled);

const expensive = Object.fromEntries(Object.entries(prices).filter(([, p]) => p > 1));
console.log(expensive);

const inverted = Object.fromEntries(Object.entries({ a: "x", b: "y" }).map(([k, v]) => [v, k]));
console.log(inverted);

const fromMap = Object.fromEntries(new Map([["one", 1], ["two", 2]]));
console.log(fromMap);

const params = new URLSearchParams("page=2&sort=asc");
console.log(Object.fromEntries(params));

function mapValues<T, U>(obj: Record<string, T>, fn: (v: T) => U): Record<string, U> {
  return Object.fromEntries(Object.entries(obj).map(([k, v]) => [k, fn(v)]));
}
console.log(mapValues(prices, (p) => `$${p.toFixed(2)}`));

const total = Object.values(prices).reduce((a, b) => a + b, 0);
console.log(total, Object.keys(prices).length);

for (const [key, value] of Object.entries(prices)) {
  console.log(`${key.padEnd(8)}${value}`);
}
