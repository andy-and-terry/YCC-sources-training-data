const sleep = (ms: number) => new Promise<void>((r) => setTimeout(r, ms));

export async function mapLimit<T, R>(
  items: T[],
  limit: number,
  worker: (item: T, index: number) => Promise<R>,
): Promise<R[]> {
  const results = new Array<R>(items.length);
  let next = 0;

  async function runner(): Promise<void> {
    while (next < items.length) {
      const i = next++;
      results[i] = await worker(items[i], i);
    }
  }

  await Promise.all(Array.from({ length: Math.min(limit, items.length) }, runner));
  return results;
}

let active = 0;
let peak = 0;

mapLimit([5, 1, 4, 2, 3, 6], 2, async (n) => {
  active++;
  peak = Math.max(peak, active);
  await sleep(n * 5);
  active--;
  return n * 10;
}).then((r) => console.log(r, "peak concurrency:", peak));
