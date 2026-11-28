async function* pages(total, size) {
  for (let start = 0; start < total; start += size) {
    await new Promise((r) => setTimeout(r, 1));
    yield Array.from({ length: Math.min(size, total - start) }, (_, i) => start + i);
  }
}

(async () => {
  for await (const page of pages(7, 3)) console.log(page);
})();
