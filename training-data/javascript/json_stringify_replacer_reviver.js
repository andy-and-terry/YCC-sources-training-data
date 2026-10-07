const data = {
  name: 'Ann',
  password: 'secret',
  joined: new Date(Date.UTC(2024, 0, 1)),
  scores: new Set([1, 2]),
  toJSON() { return { ...this, extra: true }; },
};

const text = JSON.stringify(data, (key, value) => {
  if (key === 'password') return undefined;
  if (value instanceof Set) return [...value];
  return value;
}, 2);
console.log(text);

const parsed = JSON.parse(text, (key, value) =>
  key === 'joined' ? new Date(value) : value);
console.log(parsed.joined instanceof Date, parsed.joined.getUTCFullYear());
console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined] }));
