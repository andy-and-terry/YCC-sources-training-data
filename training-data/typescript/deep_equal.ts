export function deepEqual(a: unknown, b: unknown): boolean {
  if (Object.is(a, b)) return true;
  if (typeof a !== "object" || typeof b !== "object" || a === null || b === null) return false;

  if (Array.isArray(a) !== Array.isArray(b)) return false;
  if (a instanceof Date && b instanceof Date) return a.getTime() === b.getTime();

  const ka = Object.keys(a);
  const kb = Object.keys(b);
  if (ka.length !== kb.length) return false;

  return ka.every(
    (k) =>
      Object.prototype.hasOwnProperty.call(b, k) &&
      deepEqual((a as Record<string, unknown>)[k], (b as Record<string, unknown>)[k]),
  );
}

console.log(deepEqual({ a: 1, b: [1, 2, { c: 3 }] }, { b: [1, 2, { c: 3 }], a: 1 }));
console.log(deepEqual([1, 2, 3], [1, 2, 4]));
console.log(deepEqual(NaN, NaN));
console.log(deepEqual(new Date(0), new Date(0)));
console.log(deepEqual({ a: undefined }, { b: undefined }));
