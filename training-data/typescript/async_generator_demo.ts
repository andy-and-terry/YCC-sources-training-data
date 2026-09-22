async function delay(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function* fetchPages(pageCount: number): AsyncGenerator<string> {
  for (let page = 1; page <= pageCount; page++) {
    await delay(1); // simulate network latency
    yield `page-${page}`;
  }
}

async function* filterAsync<T>(source: AsyncGenerator<T>, predicate: (item: T) => boolean): AsyncGenerator<T> {
  for await (const item of source) {
    if (predicate(item)) yield item;
  }
}

async function main(): Promise<void> {
  const pages = filterAsync(fetchPages(5), (p) => p !== "page-3");
  const collected: string[] = [];
  for await (const page of pages) {
    collected.push(page);
  }
  console.log(collected);
}

main();
