async function delay(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function* fetchPages(pageCount) {
  for (let page = 1; page <= pageCount; page++) {
    await delay(1);
    yield { page, items: [page * 10, page * 10 + 1] };
  }
}

async function* flattenItems(pages) {
  for await (const page of pages) {
    for (const item of page.items) {
      yield item;
    }
  }
}

async function* filterAsync(source, predicate) {
  for await (const value of source) {
    if (predicate(value)) yield value;
  }
}

async function collect(asyncIterable) {
  const results = [];
  for await (const value of asyncIterable) {
    results.push(value);
  }
  return results;
}

async function main() {
  const pipeline = filterAsync(flattenItems(fetchPages(3)), (n) => n % 2 === 0);
  const evens = await collect(pipeline);
  console.log(evens);
}

main();

module.exports = { fetchPages, flattenItems, filterAsync, collect };
