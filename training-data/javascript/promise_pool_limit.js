async function pool(tasks, limit) {
  const results = [];
  let next = 0;
  async function worker() {
    while (next < tasks.length) {
      const i = next++;
      results[i] = await tasks[i]();
    }
  }
  await Promise.all(Array.from({ length: limit }, worker));
  return results;
}

const delay = (ms, v) => () => new Promise((r) => setTimeout(() => r(v), ms));
pool([delay(30, "a"), delay(10, "b"), delay(20, "c")], 2).then(console.log);
