class Range {
  constructor(start, end, step = 1) {
    this.start = start;
    this.end = end;
    this.step = step;
  }

  [Symbol.iterator]() {
    let current = this.start;
    const { end, step } = this;
    return {
      next: () => {
        if (current > end) return { done: true, value: undefined };
        const value = current;
        current += step;
        return { done: false, value };
      },
    };
  }
}

const r = new Range(1, 10, 3);
console.log([...r]);
console.log(Array.from(r, (x) => x * x));
const [first, second] = r;
console.log(first, second);
console.log(Math.max(...new Range(1, 5)));
