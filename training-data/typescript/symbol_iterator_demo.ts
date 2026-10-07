class NumberRange implements Iterable<number> {
  constructor(private start: number, private end: number, private step = 1) {}

  [Symbol.iterator](): Iterator<number> {
    let current = this.start;
    const { end, step } = this;
    return {
      next(): IteratorResult<number> {
        if (current > end) return { value: undefined, done: true };
        const value = current;
        current += step;
        return { value, done: false };
      },
    };
  }
}

const r = new NumberRange(1, 10, 3);
console.log([...r]);
const seen: number[] = [];
for (const n of new NumberRange(0, 4)) seen.push(n);
console.log(seen.join(" "));
const [a, b] = new NumberRange(5, 100);
console.log(a, b, Math.max(...new NumberRange(1, 5)));
