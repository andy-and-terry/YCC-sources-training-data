// A generic memoization wrapper: caches results by a stringified key of the
// arguments, so repeated calls with the same inputs skip recomputation.
function memoize(fn, keyFn = (...args) => JSON.stringify(args)) {
  const cache = new Map();
  return function memoized(...args) {
    const key = keyFn(...args);
    if (cache.has(key)) return cache.get(key);
    const result = fn.apply(this, args);
    cache.set(key, result);
    return result;
  };
}

let calls = 0;
function slowFib(n) {
  calls++;
  if (n <= 1) return n;
  return slowFib(n - 1) + slowFib(n - 2);
}

const memoFib = memoize(function fib(n) {
  calls++;
  if (n <= 1) return n;
  return memoFib(n - 1) + memoFib(n - 2);
});

console.log(slowFib(10), 'calls so far:', calls);
calls = 0;
console.log(memoFib(10), 'calls so far:', calls);
console.log(memoFib(10), 'calls so far (cached):', calls);

module.exports = { memoize };
