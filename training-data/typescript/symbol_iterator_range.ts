class NumberRange implements Iterable<number> {
  constructor(
    private readonly start: number,
    private readonly end: number,
    private readonly step: number = 1,
  ) {}

  [Symbol.iterator](): Iterator<number> {
    let current = this.start;
    const { end, step } = this;
    return {
      next(): IteratorResult<number> {
        if (current < end) {
          const value = current;
          current += step;
          return { value, done: false };
        }
        return { value: undefined, done: true };
      },
    };
  }

  *reversed(): Generator<number> {
    const items = [...this];
    for (let i = items.length - 1; i >= 0; i--) yield items[i];
  }
}

const r = new NumberRange(0, 10, 3);
console.log([...r]);
console.log(Array.from(r, (n) => n * 2));
console.log([...r.reversed()]);
for (const n of new NumberRange(1, 4)) console.log(n);
const [first, second] = new NumberRange(5, 100);
console.log(first, second);
console.log(Math.max(...new NumberRange(0, 5)));
