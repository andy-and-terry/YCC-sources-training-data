function memoize<A extends unknown[], R>(
  fn: (...args: A) => R,
  keyFn: (...args: A) => string = (...args) => JSON.stringify(args)
): (...args: A) => R {
  const cache = new Map<string, R>();
  return (...args: A): R => {
    const key = keyFn(...args);
    if (cache.has(key)) return cache.get(key)!;
    const value = fn(...args);
    cache.set(key, value);
    return value;
  };
}

let calls = 0;
const slowAdd = (a: number, b: number): number => {
  calls++;
  return a + b;
};
const fastAdd = memoize(slowAdd);

console.log(fastAdd(1, 2), fastAdd(1, 2), fastAdd(2, 3));
console.log("underlying calls:", calls);
