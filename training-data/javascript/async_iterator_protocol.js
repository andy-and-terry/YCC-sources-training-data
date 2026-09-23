class PollingStream {
  constructor(values, delayMs = 5) {
    this.values = values;
    this.delayMs = delayMs;
  }

  [Symbol.asyncIterator]() {
    let index = 0;
    const values = this.values;
    const delayMs = this.delayMs;
    return {
      next() {
        if (index >= values.length) {
          return Promise.resolve({ value: undefined, done: true });
        }
        const value = values[index++];
        return new Promise((resolve) =>
          setTimeout(() => resolve({ value, done: false }), delayMs)
        );
      },
      return(value) {
        index = values.length;
        return Promise.resolve({ value, done: true });
      },
    };
  }
}

async function main() {
  const stream = new PollingStream(['a', 'b', 'c', 'd']);
  const collected = [];
  for await (const item of stream) {
    collected.push(item);
    if (collected.length === 2) break;
  }
  console.log(collected);

  const full = [];
  for await (const item of new PollingStream([1, 2, 3])) {
    full.push(item);
  }
  console.log(full);
}

main();
module.exports = { PollingStream };
