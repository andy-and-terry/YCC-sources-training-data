export function* collatz(n: number): Generator<number> {
  yield n;
  while (n !== 1) {
    n = n % 2 === 0 ? n / 2 : 3 * n + 1;
    yield n;
  }
}

const memo = new Map<number, number>([[1, 0]]);
export function steps(start: number): number {
  const path: number[] = [];
  let n = start;
  while (!memo.has(n)) {
    path.push(n);
    n = n % 2 === 0 ? n / 2 : 3 * n + 1;
  }
  let s = memo.get(n)!;
  while (path.length) memo.set(path.pop()!, ++s);
  return memo.get(start)!;
}

const seq = [...collatz(27)];
console.log(seq.slice(0, 15), "... length", seq.length);
let best = 1;
for (let i = 1; i < 10000; i++) if (steps(i) > steps(best)) best = i;
console.log("longest under 10000:", best, steps(best));
