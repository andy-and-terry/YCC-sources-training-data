export function jumpSearch(a: readonly number[], target: number): number {
  const n = a.length;
  const step = Math.max(1, Math.floor(Math.sqrt(n)));
  let prev = 0;
  while (prev < n && a[Math.min(prev + step, n) - 1] < target) prev += step;
  for (let i = prev; i < Math.min(prev + step, n); i++) if (a[i] === target) return i;
  return -1;
}

const fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610];
console.log(jumpSearch(fib, 55), jumpSearch(fib, 4));
