async function mapLimit<T, R>(
  items: T[],
  limit: number,
  fn: (item: T, index: number) => Promise<R>
): Promise<R[]> {
  const results: R[] = new Array(items.length);
  let next = 0;

  async function worker(): Promise<void> {
    while (next < items.length) {
      const i = next++;
      results[i] = await fn(items[i], i);
    }
  }

  const workers = Array.from({ length: Math.min(limit, items.length) }, worker);
  await Promise.all(workers);
  return results;
}

let active = 0;
let maxActive = 0;

mapLimit([1, 2, 3, 4, 5, 6], 2, async (n) => {
  active++;
  maxActive = Math.max(maxActive, active);
  await new Promise((r) => setTimeout(r, 5));
  active--;
  return n * n;
}).then((out) => console.log(out, "max concurrent:", maxActive));
