function deepEqual(a, b) {
  if (Object.is(a, b)) return true;
  if (typeof a !== 'object' || typeof b !== 'object' || !a || !b) return false;
  if (Array.isArray(a) !== Array.isArray(b)) return false;
  if (a instanceof Date && b instanceof Date) return a.getTime() === b.getTime();
  const ka = Object.keys(a), kb = Object.keys(b);
  if (ka.length !== kb.length) return false;
  return ka.every((k) => Object.hasOwn(b, k) && deepEqual(a[k], b[k]));
}

console.log(deepEqual({ a: [1, { b: 2 }] }, { a: [1, { b: 2 }] }));
console.log(deepEqual({ a: 1 }, { a: 2 }));
console.log(deepEqual(NaN, NaN), NaN === NaN);
console.log(deepEqual(new Date(0), new Date(0)));
