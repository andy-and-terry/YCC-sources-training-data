// Map keeps insertion order and allows any key type; WeakSet holds objects
// without preventing garbage collection.
const m = new Map();
const objKey = { id: 1 };
m.set(objKey, 'object key').set('s', 'string key').set(NaN, 'nan key');
console.log(m.get(objKey), m.get(NaN), m.size);
console.log([...m.keys()].length);

const counts = new Map();
for (const w of 'the cat and the hat and the bat'.split(' ')) {
  counts.set(w, (counts.get(w) ?? 0) + 1);
}
console.log([...counts].sort((a, b) => b[1] - a[1]).slice(0, 2));
console.log(Object.fromEntries(counts));

const visited = new WeakSet();
function visit(node) {
  if (visited.has(node)) return 'already visited';
  visited.add(node);
  return 'first visit';
}
const node = {};
console.log(visit(node), visit(node));
