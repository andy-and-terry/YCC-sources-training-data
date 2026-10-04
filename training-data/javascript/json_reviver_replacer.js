const data = {
  name: 'Report',
  created: new Date('2024-05-01T10:00:00Z'),
  secret: 'hunter2',
  tags: new Set(['a', 'b']),
  scores: [1, 2, 3],
};

const json = JSON.stringify(
  data,
  (key, value) => {
    if (key === 'secret') return undefined;
    if (value instanceof Set) return { __type: 'Set', values: [...value] };
    return value;
  },
  2
);
console.log(json);

const revived = JSON.parse(json, (key, value) => {
  if (key === 'created') return new Date(value);
  if (value && value.__type === 'Set') return new Set(value.values);
  return value;
});
console.log(revived.created instanceof Date, revived.tags.has('a'));

console.log(JSON.stringify({ a: 1, b: 2, c: 3 }, ['a', 'c']));

class Temp {
  constructor(c) { this.c = c; }
  toJSON() { return { celsius: this.c, fahrenheit: this.c * 9 / 5 + 32 }; }
}
console.log(JSON.stringify([new Temp(100)]));
