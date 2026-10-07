export function* mergeSorted<T>(sources: Iterable<T>[], cmp: (a: T, b: T) => number): Generator<T> {
  const iters = sources.map((s) => s[Symbol.iterator]());
  const heads = iters.map((it) => it.next());
  for (;;) {
    let best = -1;
    heads.forEach((h, i) => {
      if (!h.done && (best < 0 || cmp(h.value, (heads[best] as IteratorYieldResult<T>).value) < 0)) best = i;
    });
    if (best < 0) return;
    yield (heads[best] as IteratorYieldResult<T>).value;
    heads[best] = iters[best].next();
  }
}

function* multiples(k: number, limit: number): Generator<number> {
  for (let x = k; x <= limit; x += k) yield x;
}

console.log([...mergeSorted([[1, 4, 7], [2, 3, 8, 9]], (a, b) => a - b)]);
console.log([...mergeSorted([multiples(3, 20), multiples(5, 20), multiples(7, 20)], (a, b) => a - b)]);
