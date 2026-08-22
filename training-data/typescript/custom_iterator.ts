class Fibonacci implements Iterable<number> {
  constructor(private limit: number) {}

  [Symbol.iterator](): Iterator<number> {
    let a = 0;
    let b = 1;
    let count = 0;
    const limit = this.limit;
    return {
      next(): IteratorResult<number> {
        if (count >= limit) return { done: true, value: undefined };
        const value = a;
        [a, b] = [b, a + b];
        count++;
        return { value, done: false };
      },
    };
  }
}

console.log([...new Fibonacci(8)]);
