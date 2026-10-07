async function* paginatedFetch(pages, delayMs = 5) {
  for (const page of pages) {
    await new Promise((resolve) => setTimeout(resolve, delayMs));
    yield page;
  }
}

async function* flatten(asyncIterable) {
  for await (const page of asyncIterable) {
    yield* page;
  }
}

async function main() {
  const pages = [
    [1, 2, 3],
    [4, 5],
    [6, 7, 8, 9],
  ];

  const results = [];
  for await (const item of flatten(paginatedFetch(pages))) {
    results.push(item);
  }
  console.log(results);
}

main();
module.exports = { paginatedFetch, flatten };
