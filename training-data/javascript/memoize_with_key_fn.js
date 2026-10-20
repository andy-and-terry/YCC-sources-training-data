function memoize(fn, keyFn = JSON.stringify) {
  const cache = new Map();
  return (...args) => {
    const k = keyFn(args);
    if (!cache.has(k)) cache.set(k, fn(...args));
    return cache.get(k);
  };
}
const slow = memoize((a, b) => { console.log("calc"); return a + b; });
console.log(slow(1, 2), slow(1, 2));
