type List<T> = { head: T; tail: List<T> } | null;

const fromArray = <T>(xs: readonly T[]): List<T> => xs.reduceRight<List<T>>((tail, head) => ({ head, tail }), null);

function toArray<T>(l: List<T>): T[] {
  const out: T[] = [];
  for (; l; l = l.tail) out.push(l.head);
  return out;
}

/** Purely functional merge that builds a new list (recursive). */
export function merge<T>(a: List<T>, b: List<T>, cmp: (x: T, y: T) => number): List<T> {
  if (!a) return b;
  if (!b) return a;
  return cmp(a.head, b.head) <= 0
    ? { head: a.head, tail: merge(a.tail, b, cmp) }
    : { head: b.head, tail: merge(a, b.tail, cmp) };
}

const byNum = (x: number, y: number): number => x - y;
console.log(toArray(merge(fromArray([1, 2, 4, 9]), fromArray([1, 3, 4, 5, 10]), byNum)));
