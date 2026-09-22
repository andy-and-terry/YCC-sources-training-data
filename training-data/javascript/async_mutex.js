// A minimal async mutex: serializes access to a critical section across
// concurrently-started async tasks by chaining a promise queue.
class AsyncMutex {
  constructor() {
    this._locked = Promise.resolve();
  }

  async runExclusive(task) {
    const previous = this._locked;
    let release;
    this._locked = new Promise((resolve) => {
      release = resolve;
    });
    await previous;
    try {
      return await task();
    } finally {
      release();
    }
  }
}

function delay(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function main() {
  const mutex = new AsyncMutex();
  let counter = 0;
  const order = [];

  async function increment(label, ms) {
    return mutex.runExclusive(async () => {
      order.push(`${label}-start`);
      const before = counter;
      await delay(ms);
      counter = before + 1;
      order.push(`${label}-end`);
    });
  }

  await Promise.all([increment('a', 15), increment('b', 5), increment('c', 10)]);

  console.log(order);
  console.log('counter:', counter);
}

main();

module.exports = { AsyncMutex };
