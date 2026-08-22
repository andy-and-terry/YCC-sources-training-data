class Fibonacci {
  constructor(limit) {
    this.limit = limit;
  }

  [Symbol.iterator]() {
    let a = 0;
    let b = 1;
    let count = 0;
    const limit = this.limit;
    return {
      next() {
        if (count >= limit) return { done: true };
        const value = a;
        [a, b] = [b, a + b];
        count++;
        return { value, done: false };
      },
    };
  }
}

console.log([...new Fibonacci(8)]);
module.exports = { Fibonacci };
