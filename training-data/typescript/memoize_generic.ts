export function memoize<A extends unknown[], R>(
  fn: (...args: A) => R,
  keyFn: (...args: A) => string = (...args) => JSON.stringify(args),
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
const slowSquare = (n: number): number => {
  calls++;
  return n * n;
};

const fastSquare = memoize(slowSquare);
console.log(fastSquare(9), fastSquare(9), fastSquare(4));
console.log("underlying calls:", calls);

const fib: (n: number) => bigint = memoize((n: number): bigint =>
  n < 2 ? BigInt(n) : fib(n - 1) + fib(n - 2),
);
console.log(fib(90).toString());
