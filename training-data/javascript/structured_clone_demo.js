const original = {
  name: 'config',
  created: new Date('2024-01-01T00:00:00Z'),
  tags: new Set(['a', 'b']),
  nested: { values: [1, 2, 3] },
};

const clone = structuredClone(original);
clone.nested.values.push(4);
clone.tags.add('c');

console.log(original.nested.values);
console.log([...original.tags]);
console.log(clone.nested.values);
console.log([...clone.tags]);
console.log(clone.created instanceof Date, clone.created.getTime() === original.created.getTime());
console.log(clone === original, clone.nested === original.nested);

try {
  structuredClone({ fn: () => 'nope' });
} catch (err) {
  console.log(err.constructor.name);
}

module.exports = { original, clone };
