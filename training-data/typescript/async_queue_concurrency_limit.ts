async function runLimited<T>(tasks: (() => Promise<T>)[], limit: number): Promise<T[]> {
  const results: T[] = new Array(tasks.length);
  let next = 0;

  async function worker(): Promise<void> {
    while (next < tasks.length) {
      const index = next++;
      results[index] = await tasks[index]();
    }
  }

  await Promise.all(Array.from({ length: Math.min(limit, tasks.length) }, worker));
  return results;
}

const sleep = (ms: number) => new Promise<void>((r) => setTimeout(r, ms));
const tasks = [30, 10, 20, 5, 15].map((ms, i) => async () => {
  await sleep(ms);
  console.log(`task ${i} done`);
  return i * i;
});

runLimited(tasks, 2).then((r) => console.log(r));
