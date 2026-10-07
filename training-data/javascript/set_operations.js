const admins = new Set(['alice', 'bob', 'carol']);
const editors = new Set(['bob', 'carol', 'dave']);

console.log([...admins.union(editors)]);
console.log([...admins.intersection(editors)]);
console.log([...admins.difference(editors)]);
console.log([...admins.symmetricDifference(editors)]);
console.log(admins.isSubsetOf(new Set(['alice', 'bob', 'carol', 'dave'])));
console.log(admins.isDisjointFrom(new Set(['zoe'])));

function dedupeBy(items, keyFn) {
  const seen = new Set();
  return items.filter((item) => {
    const key = keyFn(item);
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });
}

console.log(dedupeBy([1.1, 1.9, 2.2, 2.8, 3.5], Math.floor));

module.exports = { admins, editors, dedupeBy };
