function memoize(fn) {
  const cache = new Map();
  return n => cache.has(n) ? cache.get(n) : (cache.set(n, fn(n)), cache.get(n));
}
const fib = memoize(n => n < 2 ? n : fib(n - 1) + fib(n - 2));
console.log(fib(50));
