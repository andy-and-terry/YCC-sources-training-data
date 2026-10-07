function sum(...nums) {
  return nums.reduce((a, b) => a + b, 0);
}

const a = [1, 2, 3];
const b = [4, 5];
console.log(sum(...a, ...b));
console.log([...a, 99, ...b]);
console.log(Math.max(...a, ...b));

const copy = [...a];
copy.push(10);
console.log(a, copy);

const defaults = { theme: "light", size: 12, nested: { x: 1 } };
const overrides = { size: 14, extra: true };
const merged = { ...defaults, ...overrides };
console.log(merged);

// Spread is shallow: nested objects stay shared.
merged.nested.x = 2;
console.log(defaults.nested.x);

const { theme, ...rest } = merged;
console.log(theme, rest);

console.log([..."héllo"].length, [...new Set("mississippi")].join(""));
console.log({ ...null, ...undefined, ..."hi" });

const withoutKey = (o, key) => {
  const { [key]: _removed, ...remaining } = o;
  return remaining;
};
console.log(withoutKey({ a: 1, b: 2, c: 3 }, "b"));
