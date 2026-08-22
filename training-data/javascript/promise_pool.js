async function promisePool(tasks, concurrency) {
  const results = new Array(tasks.length);
  let nextIndex = 0;

  async function worker() {
    while (nextIndex < tasks.length) {
      const current = nextIndex++;
      results[current] = await tasks[current]();
    }
  }

  const workers = Array.from({ length: Math.min(concurrency, tasks.length) }, () => worker());
  await Promise.all(workers);
  return results;
}

async function main() {
  const tasks = Array.from({ length: 6 }, (_, i) => async () => {
    await new Promise((resolve) => setTimeout(resolve, 5));
    return i * i;
  });
  const results = await promisePool(tasks, 2);
  console.log(results);
}

main();
module.exports = { promisePool };
